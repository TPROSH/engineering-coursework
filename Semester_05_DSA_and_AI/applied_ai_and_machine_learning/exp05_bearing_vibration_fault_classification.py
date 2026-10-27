GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    confusion_matrix,
    accuracy_score,
    precision_score,
    recall_score
)

# Load dataset
df = pd.read_csv("data/E_bearing_condition.csv")

# Split exactly as given in the 'split' column (Rule R3)
train_df = df[df["split"] == "train"].copy()
val_df = df[df["split"] == "val"].copy()
test_df = df[df["split"] == "test"].copy()

y_train = train_df["fault"].to_numpy(dtype=int)
y_val = val_df["fault"].to_numpy(dtype=int)
y_test = test_df["fault"].to_numpy(dtype=int)


# ---------------------------------------------------------
# E1: Honesty floor and one-feature model (vib_rms_mm_s raw)
# ---------------------------------------------------------
always_healthy_acc = np.mean(y_test == 0) * 100.0

X_train_1 = train_df[["vib_rms_mm_s"]].to_numpy(dtype=float)
X_test_1 = test_df[["vib_rms_mm_s"]].to_numpy(dtype=float)

clf_1 = LogisticRegression()
clf_1.fit(X_train_1, y_train)

w_1 = float(clf_1.coef_[0, 0])
b_1 = float(clf_1.intercept_[0])
v_star = -b_1 / w_1

y_pred_1 = clf_1.predict(X_test_1)
acc_1 = accuracy_score(y_test, y_pred_1) * 100.0
prec_1 = precision_score(y_test, y_pred_1) * 100.0
rec_1 = recall_score(y_test, y_pred_1) * 100.0

print("\n--- E1: Honesty Floor & One-Feature Model (vib_rms_mm_s raw) ---")
print(f"Always-healthy test accuracy       = {always_healthy_acc:.1f}%")
print(f"Weight w (3 d.p.)                  = {w_1:.3f} ({w_1:.6f})")
print(f"Bias b (3 d.p.)                    = {b_1:.3f} ({b_1:.6f})")
print(f"Decision boundary v* = -b/w (2 d.p)= {v_star:.2f} mm/s ({v_star:.6f})")
print(
    f"Test accuracy / precision / recall = "
    f"{acc_1:.1f}% / {prec_1:.1f}% / {rec_1:.1f}%"
)


# ---------------------------------------------------------
# E2: Two features (both standardised) at threshold 0.5
# ---------------------------------------------------------
feature_cols = ["vib_rms_mm_s", "kurtosis"]
X_train_2_raw = train_df[feature_cols].to_numpy(dtype=float)
X_val_2_raw = val_df[feature_cols].to_numpy(dtype=float)
X_test_2_raw = test_df[feature_cols].to_numpy(dtype=float)

scaler = StandardScaler()
X_train_2 = scaler.fit_transform(X_train_2_raw)
X_val_2 = scaler.transform(X_val_2_raw)
X_test_2 = scaler.transform(X_test_2_raw)

clf_2 = LogisticRegression()
clf_2.fit(X_train_2, y_train)

y_pred_2 = clf_2.predict(X_test_2)
cm_2 = confusion_matrix(y_test, y_pred_2)
tn_2, fp_2, fn_2, tp_2 = cm_2.ravel()

acc_2 = accuracy_score(y_test, y_pred_2) * 100.0
prec_2 = precision_score(y_test, y_pred_2) * 100.0
rec_2 = recall_score(y_test, y_pred_2) * 100.0

print("\n--- E2: Two-Feature Standardised Model (Threshold 0.5) ---")
print("Test Confusion Matrix (rows = actual, cols = predicted):")
print(f"  Actually healthy (0): pred healthy = {tn_2:3d}, pred faulty = {fp_2:3d}")
print(f"  Actually faulty  (1): pred healthy = {fn_2:3d}, pred faulty = {tp_2:3d}")
print(f"Accuracy  = {acc_2:.1f}%")
print(f"Precision = {prec_2:.1f}%")
print(f"Recall    = {rec_2:.1f}%")


# ---------------------------------------------------------
# E3: Moving the threshold on validation rows
# ---------------------------------------------------------
thresholds = np.round(np.arange(0.05, 0.951, 0.05), 2)
val_probs = clf_2.predict_proba(X_val_2)[:, 1]
test_probs = clf_2.predict_proba(X_test_2)[:, 1]

val_recalls = []
for tau in thresholds:
    val_pred_tau = (val_probs >= tau).astype(int)
    val_recalls.append(recall_score(y_val, val_pred_tau))

val_recalls = np.array(val_recalls)
max_val_recall_pct = float(np.max(val_recalls) * 100.0)
chosen_tau = float(np.max(thresholds[val_recalls >= 0.80]))

test_pred_tau = (test_probs >= chosen_tau).astype(int)
tn_t, fp_t, fn_t, tp_t = confusion_matrix(y_test, test_pred_tau).ravel()

test_rec_tau = recall_score(y_test, test_pred_tau) * 100.0
test_prec_tau = precision_score(y_test, test_pred_tau) * 100.0
test_far_tau = (fp_t / (fp_t + tn_t)) * 100.0

# Predict P(fault) for a bearing with v = 2.6 mm/s, kurtosis = 4.2
x_query = scaler.transform(np.array([[2.6, 4.2]]))
p_fault_query = float(clf_2.predict_proba(x_query)[0, 1])

print("\n--- E3: Threshold Selection & Test Evaluation ---")
print(f"Chosen tau (largest with val recall >= 0.80) = {chosen_tau:.2f}")
print(f"Highest validation recall reachable on grid  = {max_val_recall_pct:.1f}%")
print(
    f"Test recall / precision at tau = {chosen_tau:.2f}        = "
    f"{test_rec_tau:.1f}% / {test_prec_tau:.1f}%"
)
print(f"Test false-alarm rate FP/(FP+TN) at tau      = {test_far_tau:.1f}% ({fp_t}/{fp_t + tn_t})")
print(f"P(fault) for v = 2.6 mm/s, kurtosis = 4.2    = {p_fault_query:.3f} ({p_fault_query:.6f})")