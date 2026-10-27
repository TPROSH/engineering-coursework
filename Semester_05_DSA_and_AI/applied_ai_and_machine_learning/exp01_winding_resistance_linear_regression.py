GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import HuberRegressor

df = pd.read_csv("data/A_winding_resistance.csv")

# Extract temperature and resistance
x = df["temp_C"].to_numpy(dtype=float)
y = df["resistance_ohm"].to_numpy(dtype=float)

# Calculate the means
x_mean = np.mean(x)
y_mean = np.mean(y)

# Calculate Sxy and Sxx
Sxy = np.sum((x - x_mean) * (y - y_mean))
Sxx = np.sum((x - x_mean) ** 2)

# Calculate slope and intercept
theta1 = Sxy / Sxx
theta0 = y_mean - theta1 * x_mean

print("Manual NumPy method")
print("theta0 =", theta0)
print("theta1 =", theta1)

# Method (b): Normal equation
X = np.column_stack((np.ones(len(x)), x))
theta_normal = np.linalg.inv(X.T @ X) @ X.T @ y
print("\nNormal equation method")
print("theta0 =", theta_normal[0])
print("theta1 =", theta_normal[1])


# Method (c): np.linalg.lstsq
theta_lstsq = np.linalg.lstsq(X, y, rcond=None)[0]
print("\nnp.linalg.lstsq method")
print("theta0 =", theta_lstsq[0])
print("theta1 =", theta_lstsq[1])

# Method (d): scikit-learn LinearRegression
model = LinearRegression()
model.fit(x.reshape(-1, 1), y)

print("\nLinearRegression method")
print("theta0 =", model.intercept_)
print("theta1 =", model.coef_[0])

# Compare all four methods
all_theta0 = [
    theta0,
    theta_normal[0],
    theta_lstsq[0],
    model.intercept_
]
all_theta1 = [
    theta1,
    theta_normal[1],
    theta_lstsq[1],
    model.coef_[0]
]
largest_difference = max(
    max(all_theta0) - min(all_theta0),
    max(all_theta1) - min(all_theta1)
)

# Training RMSE using LinearRegression
y_pred = model.predict(x.reshape(-1, 1))
rmse = np.sqrt(np.mean((y_pred - y) ** 2))
print("\nA1 comparison")
print("Largest absolute coefficient difference =", largest_difference)
print("Training RMSE =", rmse)


# A2: Calculate physical parameters
R20 = theta0 + 20 * theta1
alpha = theta1 / R20

print("\nA2 physical parameters")
print("R20 =", R20)
print("alpha =", alpha)

# Handbook comparison
alpha_handbook = 0.00393
percentage_difference = (
    abs(alpha - alpha_handbook) / alpha_handbook
) * 100
print("Handbook alpha =", alpha_handbook)
print("Percentage difference =", percentage_difference)

# A3: Load logger data
logger_df = pd.read_csv(
    "data/A_winding_resistance_logger.csv"
)
x_logger = logger_df["temp_C"].to_numpy(dtype=float)
y_logger = logger_df["resistance_ohm"].to_numpy(dtype=float)
print("\nLogger dataset")
print("Number of rows:", len(logger_df))
print(logger_df.head())

# A3: Fit both models on logger data

# Ordinary linear regression
logger_lr = LinearRegression()
logger_lr.fit(x_logger.reshape(-1, 1), y_logger)

# Robust regression
logger_huber = HuberRegressor()
logger_huber.fit(x_logger.reshape(-1, 1), y_logger)
print("\nA3 logger regression results")
print("LinearRegression:")
print("Intercept =", logger_lr.intercept_)
print("Slope =", logger_lr.coef_[0])
print("\nHuberRegressor:")
print("Intercept =", logger_huber.intercept_)
print("Slope =", logger_huber.coef_[0])

# Convert logger model coefficients to physical parameters

# LinearRegression
R20_lr = logger_lr.intercept_ + 20 * logger_lr.coef_[0]
alpha_lr = logger_lr.coef_[0] / R20_lr

# HuberRegressor
R20_huber = logger_huber.intercept_ + 20 * logger_huber.coef_[0]
alpha_huber = logger_huber.coef_[0] / R20_huber

# Percentage change relative to the Part A2 estimate
change_lr = ((alpha_lr - alpha) / alpha) * 100
change_huber = ((alpha_huber - alpha) / alpha) * 100

print("\nA3 physical parameters")
print("LinearRegression R20 =", R20_lr)
print("LinearRegression alpha =", alpha_lr)
print("LinearRegression change (%) =", change_lr)

print("\nHuberRegressor R20 =", R20_huber)
print("HuberRegressor alpha =", alpha_huber)
print("HuberRegressor change (%) =", change_huber)

# Calculate residuals from the Huber fit
huber_predictions = logger_huber.predict(
    x_logger.reshape(-1, 1)
)

huber_residuals = y_logger - huber_predictions

# Select rows with absolute residual greater than 0.02 ohm
outlier_mask = np.abs(huber_residuals) > 0.02

outlier_rows = logger_df.loc[outlier_mask].copy()
outlier_rows["Huber residual (ohm)"] = huber_residuals[outlier_mask]

print("\nLogger rows with |Huber residual| > 0.02 ohm")
print(outlier_rows.to_string(index=False))
print("Number of flagged rows:", len(outlier_rows))

# A4: Diagnose the influence of flagged readings

baseline_intercept = logger_lr.intercept_
baseline_slope = logger_lr.coef_[0]

flagged_indices = np.where(outlier_mask)[0]

print("\nA4: Leave-one-out influence check")

for idx in flagged_indices:
    keep = np.arange(len(x_logger)) != idx

    test_model = LinearRegression()
    test_model.fit(
        x_logger[keep].reshape(-1, 1),
        y_logger[keep]
    )

    print(
        f"Row {idx}: T={x_logger[idx]:.1f} C, "
        f"R={y_logger[idx]:.4f} ohm, "
        f"intercept change="
        f"{test_model.intercept_ - baseline_intercept:.6f}, "
        f"slope change="
        f"{test_model.coef_[0] - baseline_slope:.8f}"
    )
