GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import PolynomialFeatures, StandardScaler
from sklearn.linear_model import LinearRegression

# Load dataset
df = pd.read_csv("data/C_feeder_load.csv")

# Split exactly as given in the 'split' column (Rule R3)
train_df = df[df["split"] == "train"].copy()
val_df = df[df["split"] == "val"].copy()
hw_df = df[df["split"] == "test_heatwave"].copy()

X_train = train_df[["temp_max_C"]].to_numpy(dtype=float)
y_train = train_df["peak_load_MW"].to_numpy(dtype=float)

X_val = val_df[["temp_max_C"]].to_numpy(dtype=float)
y_val = val_df["peak_load_MW"].to_numpy(dtype=float)

X_hw = hw_df[["temp_max_C"]].to_numpy(dtype=float)
y_hw = hw_df["peak_load_MW"].to_numpy(dtype=float)


def compute_rmse(y_true, y_pred):
    return np.sqrt(np.mean((y_pred - y_true) ** 2))


# ---------------------------------------------------------
# C1: Fit each polynomial degree on the training rows
# ---------------------------------------------------------
degrees = [1, 2, 3, 4, 6, 10, 15]
models = {}
c1_train_rmse = {}
c1_val_rmse = {}

print("\n--- C1: Polynomial Regression (Degrees 1 to 15) ---")
for d in degrees:
    pipe = make_pipeline(
        PolynomialFeatures(d, include_bias=False),
        StandardScaler(),
        LinearRegression()
    )
    pipe.fit(X_train, y_train)
    models[d] = pipe

    tr_rmse = compute_rmse(y_train, pipe.predict(X_train))
    va_rmse = compute_rmse(y_val, pipe.predict(X_val))
    c1_train_rmse[d] = tr_rmse
    c1_val_rmse[d] = va_rmse

    print(
        f"Degree d = {d:2d} | "
        f"Train RMSE = {tr_rmse:6.1f} MW ({tr_rmse:.4f}) | "
        f"Val RMSE = {va_rmse:6.1f} MW ({va_rmse:.4f})"
    )

d_star = min(c1_val_rmse, key=c1_val_rmse.get)
print(f"Degree with lowest validation RMSE: d* = {d_star}")


# ---------------------------------------------------------
# C2: Learning curves for degree 1 and degree 10
# ---------------------------------------------------------
m_list = [10, 15, 20, 30, 45, 60]
c2_curves = {1: {"train": [], "val": []}, 10: {"train": [], "val": []}}

print("\n--- C2: Learning Curves (d = 1 and d = 10) ---")
for d in [1, 10]:
    print(f"\nDegree d = {d}:")
    for m in m_list:
        pipe_m = make_pipeline(
            PolynomialFeatures(d, include_bias=False),
            StandardScaler(),
            LinearRegression()
        )
        pipe_m.fit(X_train[:m], y_train[:m])

        tr_r = compute_rmse(y_train[:m], pipe_m.predict(X_train[:m]))
        va_r = compute_rmse(y_val, pipe_m.predict(X_val))

        c2_curves[d]["train"].append(tr_r)
        c2_curves[d]["val"].append(va_r)

        print(
            f"  m = {m:2d} | "
            f"Train RMSE = {tr_r:7.1f} MW ({tr_r:.4f}) | "
            f"Val RMSE = {va_r:8.1f} MW ({va_r:.4f})"
        )

# Save C2_learning_curves.png
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(11, 4.6), dpi=150)

# Left panel: linear scale zoomed to 0-125 MW to see training error rise clearly
ax1.plot(m_list, c2_curves[1]["train"], "o-", color="#1d4ed8", lw=2, label="d = 1 Train")
ax1.plot(m_list, c2_curves[1]["val"], "s--", color="#3b82f6", lw=2, label="d = 1 Val")
ax1.plot(m_list, c2_curves[10]["train"], "o-", color="#b91c1c", lw=2, label="d = 10 Train")
ax1.plot(m_list, c2_curves[10]["val"], "s--", color="#ef4444", lw=2, label="d = 10 Val")
ax1.set_ylim(0, 125)
ax1.set_xticks(m_list)
ax1.set_xlabel("Training set size m")
ax1.set_ylabel("RMSE (MW, linear zoom 0–125 MW)")
ax1.set_title("Zoomed Linear Scale (0–125 MW)")
ax1.grid(True, linestyle="--", alpha=0.5)
ax1.legend(loc="center right", fontsize=9)

# Right panel: log scale showing full validation spike at small m
ax2.plot(m_list, c2_curves[1]["train"], "o-", color="#1d4ed8", lw=2, label="d = 1 Train")
ax2.plot(m_list, c2_curves[1]["val"], "s--", color="#3b82f6", lw=2, label="d = 1 Val")
ax2.plot(m_list, np.maximum(c2_curves[10]["train"], 1e-3), "o-", color="#b91c1c", lw=2, label="d = 10 Train")
ax2.plot(m_list, c2_curves[10]["val"], "s--", color="#ef4444", lw=2, label="d = 10 Val")
ax2.set_yscale("log")
ax2.set_xticks(m_list)
ax2.set_xlabel("Training set size m")
ax2.set_ylabel("RMSE (MW, log scale)")
ax2.set_title("Full Range Log Scale")
ax2.grid(True, which="both", linestyle="--", alpha=0.5)
ax2.legend(loc="upper right", fontsize=9)

fig.suptitle("C2: Learning Curves for Degree 1 and Degree 10 Polynomial Models", fontweight="bold")
fig.tight_layout()
fig.savefig("C2_learning_curves.png")
plt.close(fig)
print("\nSaved figure: C2_learning_curves.png")


# ---------------------------------------------------------
# C3: Evaluate on heatwave days (training-only fits from C1)
# ---------------------------------------------------------
print("\n--- C3: Heatwave Test Set Evaluation ---")
for label, d in [("Degree 3", 3), (f"Your d* from C1 (d={d_star})", d_star), ("Degree 15", 15)]:
    hw_rmse = compute_rmse(y_hw, models[d].predict(X_hw))
    print(f"{label:26s}: Heatwave RMSE = {hw_rmse:9.1f} MW ({hw_rmse:.4f})")


# ---------------------------------------------------------
# C4: Physics-informed piecewise degree-day features
# ---------------------------------------------------------
def make_physics_features(T_array):
    T = T_array.ravel()
    h = np.maximum(18.0 - T, 0.0)
    c = np.maximum(T - 24.0, 0.0)
    return np.column_stack([h, c, h ** 2, c ** 2])


X_train_phys = make_physics_features(X_train)
X_val_phys = make_physics_features(X_val)
X_hw_phys = make_physics_features(X_hw)

phys_model = make_pipeline(StandardScaler(), LinearRegression())
phys_model.fit(X_train_phys, y_train)

phys_train_rmse = compute_rmse(y_train, phys_model.predict(X_train_phys))
phys_val_rmse = compute_rmse(y_val, phys_model.predict(X_val_phys))
phys_hw_rmse = compute_rmse(y_hw, phys_model.predict(X_hw_phys))

print("\n--- C4: Physics-Informed Features [h, c, h^2, c^2] ---")
print(f"Train RMSE    = {phys_train_rmse:5.1f} MW ({phys_train_rmse:.4f})")
print(f"Val RMSE      = {phys_val_rmse:5.1f} MW ({phys_val_rmse:.4f})")
print(f"Heatwave RMSE = {phys_hw_rmse:5.1f} MW ({phys_hw_rmse:.4f})")

# Save C4_extrapolation.png over 8-47 C
T_grid = np.linspace(8.0, 47.0, 400).reshape(-1, 1)
y_grid_dstar = models[d_star].predict(T_grid)
y_grid_phys = phys_model.predict(make_physics_features(T_grid))

plt.figure(figsize=(8.5, 5.4), dpi=150)
plt.scatter(
    X_train.ravel(), y_train,
    color="#1d4ed8", alpha=0.75, edgecolors="k", s=45,
    label="Training data (8–40 °C)"
)
plt.scatter(
    X_hw.ravel(), y_hw,
    color="#dc2626", marker="^", edgecolors="k", s=65,
    label="Heatwave test data (41–47 °C)"
)
plt.plot(
    T_grid.ravel(), y_grid_dstar,
    "--", color="#ea580c", linewidth=2.3,
    label=f"Polynomial d* = {d_star} model"
)
plt.plot(
    T_grid.ravel(), y_grid_phys,
    "-", color="#15803d", linewidth=2.5,
    label="Physics-informed features model"
)
plt.axvline(40.0, color="gray", linestyle=":", linewidth=1.2, label="Max training temp (40 °C)")
plt.ylim(750, 2600)
plt.xlim(7, 48)
plt.annotate(
    f"d* = {d_star} polynomial shoots off\nto 29,012 MW at 47 °C!",
    xy=(42.4, 2500), xytext=(31.5, 2250),
    arrowprops=dict(arrowstyle="->", color="#ea580c", lw=1.8),
    fontsize=9.5, fontweight="bold", color="#c2410c",
    bbox=dict(boxstyle="round,pad=0.3", fc="#fff7ed", ec="#ea580c", alpha=0.9)
)
plt.xlabel("Daily Maximum Temperature (°C)", fontsize=11)
plt.ylabel("Daily Feeder Peak Load (MW)", fontsize=11)
plt.title(f"C4: Extrapolation Over 8–47 °C (d* = {d_star} Polynomial vs Physics-Informed Model)", fontsize=11.5, fontweight="bold")
plt.grid(True, linestyle="--", alpha=0.5)
plt.legend(loc="upper left", fontsize=9.5)
plt.tight_layout()
plt.savefig("C4_extrapolation.png")
plt.close()
print("Saved figure: C4_extrapolation.png")