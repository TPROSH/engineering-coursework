GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import KFold
from sklearn.linear_model import (
    LinearRegression,
    RidgeCV,
    LassoCV,
    ElasticNetCV
)

# Load dataset
df = pd.read_csv("data/D_motor_thermal.csv")

# Split exactly as given in the 'split' column (Rule R3)
train_df = df[df["split"] == "train"].copy()
test_df = df[df["split"] == "test"].copy()

feature_cols = [c for c in df.columns if c not in ("winding_rise_K", "split")]

X_train_raw = train_df[feature_cols].to_numpy(dtype=float)
y_train = train_df["winding_rise_K"].to_numpy(dtype=float)

X_test_raw = test_df[feature_cols].to_numpy(dtype=float)
y_test = test_df["winding_rise_K"].to_numpy(dtype=float)

# Standardise all 30 inputs fitted on training rows only (Rule R4)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train_raw)
X_test = scaler.transform(X_test_raw)

# Cross-validation splitter (Rule R5)
cv = KFold(n_splits=5, shuffle=True, random_state=42)


def compute_rmse(y_true, y_pred):
    return np.sqrt(np.mean((y_pred - y_true) ** 2))


# ---------------------------------------------------------
# D1: Ordinary Least Squares on all 30 standardised inputs
# ---------------------------------------------------------
ols = LinearRegression()
ols.fit(X_train, y_train)

ols_train_rmse = compute_rmse(y_train, ols.predict(X_train))
ols_test_rmse = compute_rmse(y_test, ols.predict(X_test))

print("\n--- D1: Ordinary Least Squares (30 Standardised Inputs) ---")
print(f"Train RMSE = {ols_train_rmse:.3f} K ({ols_train_rmse:.5f})")
print(f"Test RMSE  = {ols_test_rmse:.3f} K ({ols_test_rmse:.5f})")

top5_indices = np.argsort(np.abs(ols.coef_))[::-1][:5]
print("\nFive largest |coefficients| (name, signed value, |value|):")
for idx in top5_indices:
    name = feature_cols[idx]
    val = ols.coef_[idx]
    print(f"  {name:18s}: {val:+.2f} (|coef| = {abs(val):.2f})")


# ---------------------------------------------------------
# D2: Regularised Models (RidgeCV, LassoCV, ElasticNetCV)
# ---------------------------------------------------------
ridge_cv = RidgeCV(alphas=np.logspace(-3, 3, 61), cv=cv)
ridge_cv.fit(X_train, y_train)
ridge_test_rmse = compute_rmse(y_test, ridge_cv.predict(X_test))
ridge_nonzero = int(np.sum(ridge_cv.coef_ != 0))

lasso_cv = LassoCV(cv=cv, max_iter=50000, random_state=0)
lasso_cv.fit(X_train, y_train)
lasso_test_rmse = compute_rmse(y_test, lasso_cv.predict(X_test))
lasso_nonzero = int(np.sum(lasso_cv.coef_ != 0))

enet_cv = ElasticNetCV(
    l1_ratio=[0.2, 0.5, 0.8],
    cv=cv,
    max_iter=50000,
    random_state=0
)
enet_cv.fit(X_train, y_train)
enet_test_rmse = compute_rmse(y_test, enet_cv.predict(X_test))
enet_nonzero = int(np.sum(enet_cv.coef_ != 0))

print("\n--- D2: Regularised Models Summary ---")
print(
    f"OLS         | alpha = —     | l1_ratio = —   | "
    f"Test RMSE = {ols_test_rmse:.3f} K | Non-zero = {int(np.sum(ols.coef_ != 0))}"
)
print(
    f"Ridge       | alpha = {ridge_cv.alpha_:.3g} | l1_ratio = —   | "
    f"Test RMSE = {ridge_test_rmse:.3f} K | Non-zero = {ridge_nonzero}"
)
print(
    f"Lasso       | alpha = {lasso_cv.alpha_:.3g} | l1_ratio = —   | "
    f"Test RMSE = {lasso_test_rmse:.3f} K | Non-zero = {lasso_nonzero}"
)
print(
    f"Elastic Net | alpha = {enet_cv.alpha_:.3g} | l1_ratio = {enet_cv.l1_ratio_:.1f} | "
    f"Test RMSE = {enet_test_rmse:.3f} K | Non-zero = {enet_nonzero}"
)

lasso_nz_features = [
    feature_cols[i] for i in range(len(feature_cols)) if lasso_cv.coef_[i] != 0
]
print("\nFeatures with non-zero Lasso coefficients:")
print(", ".join(lasso_nz_features))
for i in range(len(feature_cols)):
    if lasso_cv.coef_[i] != 0:
        print(f"  {feature_cols[i]:18s}: {lasso_cv.coef_[i]:+.4f}")


# ---------------------------------------------------------
# D3: Selection Stability across 10 Bootstrap Resamples
# ---------------------------------------------------------
d3_table_features = [
    "torque_Nm",
    "i_band_01",
    "i_band_05",
    "i_band_06",
    "i_band_07",
    "i_band_17",
    "coolant_flow_lpm",
    "ambient_C",
    "aux_02",
    "aux_05"
]

selection_counts = {f: 0 for f in feature_cols}
num_selected_per_seed = []

print("\n--- D3: Lasso Selection Stability (Seeds s = 0..9) ---")
for s in range(10):
    idx = np.random.default_rng(s).integers(0, 60, 60)
    X_boot_raw = X_train_raw[idx]
    y_boot = y_train[idx]

    boot_scaler = StandardScaler()
    X_boot = boot_scaler.fit_transform(X_boot_raw)

    boot_lasso = LassoCV(cv=cv, max_iter=50000, random_state=0)
    boot_lasso.fit(X_boot, y_boot)

    nz_mask = boot_lasso.coef_ != 0
    n_sel = int(np.sum(nz_mask))
    num_selected_per_seed.append(n_sel)

    for i, is_nz in enumerate(nz_mask):
        if is_nz:
            selection_counts[feature_cols[i]] += 1

    print(f"Seed s = {s}: {n_sel} non-zero features")

print("\nSelection counts (/10) for D3 table features:")
for f in d3_table_features:
    print(f"  {f:18s}: {selection_counts[f]}/10")

print(
    f"\nSmallest and largest number of features selected in any of the 10 fits: "
    f"min = {min(num_selected_per_seed)}, max = {max(num_selected_per_seed)}"
)