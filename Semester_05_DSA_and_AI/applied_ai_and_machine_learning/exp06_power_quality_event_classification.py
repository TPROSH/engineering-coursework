GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, accuracy_score

# Load dataset
df = pd.read_csv("data/F_pq_events.csv")

# Split exactly as given in the 'split' column (Rule R3)
train_df = df[df["split"] == "train"].copy()
test_df = df[df["split"] == "test"].copy()

feature_cols = ["rms_pu", "thd_pct"]
X_train = train_df[feature_cols].to_numpy(dtype=float)
y_train = train_df["event"].to_numpy()

X_test = test_df[feature_cols].to_numpy(dtype=float)
y_test = test_df["event"].to_numpy()

# Class order required by the task sheet tables
table_classes = ["normal", "sag", "swell", "harmonic"]


# ---------------------------------------------------------
# F1: Fit Softmax Regression & Evaluate on Test Set
# ---------------------------------------------------------
model = make_pipeline(
    StandardScaler(),
    LogisticRegression(C=10, max_iter=2000)
)
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
cm = confusion_matrix(y_test, y_pred, labels=table_classes)
overall_acc = accuracy_score(y_test, y_pred) * 100.0

print("\n--- F1: Test Confusion Matrix (rows = true, cols = predicted) ---")
print(f"{'true \\ pred':12s} | {'normal':>8s} {'sag':>8s} {'swell':>8s} {'harmonic':>8s} | {'recall (%)':>10s}")
print("-" * 64)
for i, cls_name in enumerate(table_classes):
    row_total = np.sum(cm[i])
    rec_pct = (cm[i, i] / row_total) * 100.0 if row_total > 0 else 0.0
    print(
        f"{cls_name:12s} | {cm[i, 0]:8d} {cm[i, 1]:8d} {cm[i, 2]:8d} {cm[i, 3]:8d} | "
        f"{rec_pct:9.1f}%"
    )
print("-" * 64)
print(f"Overall test accuracy: {overall_acc:.1f}%")

# Save scatter plot of training data with decision regions as F1_regions.png
rms_min, rms_max = df["rms_pu"].min() - 0.03, df["rms_pu"].max() + 0.03
thd_min, thd_max = 0.0, df["thd_pct"].max() + 0.6

xx, yy = np.meshgrid(
    np.linspace(rms_min, rms_max, 500),
    np.linspace(thd_min, thd_max, 500)
)
grid_points = np.column_stack([xx.ravel(), yy.ravel()])
grid_pred_labels = model.predict(grid_points)

class_to_int = {c: i for i, c in enumerate(table_classes)}
grid_pred_int = np.array([class_to_int[label] for label in grid_pred_labels]).reshape(xx.shape)

bg_colors = ["#dbeafe", "#fef08a", "#dcfce7", "#fecaca"]
pt_colors = {
    "normal": "#1d4ed8",
    "sag": "#ca8a04",
    "swell": "#15803d",
    "harmonic": "#dc2626"
}
markers = {"normal": "o", "sag": "s", "swell": "^", "harmonic": "D"}

plt.figure(figsize=(8.5, 5.8), dpi=150)
cmap_bg = ListedColormap(bg_colors)
plt.contourf(xx, yy, grid_pred_int, levels=[-0.5, 0.5, 1.5, 2.5, 3.5], cmap=cmap_bg, alpha=0.65)
plt.contour(xx, yy, grid_pred_int, levels=[0.5, 1.5, 2.5], colors="k", linewidths=1.0, linestyles="--")

for cls_name in table_classes:
    sub = train_df[train_df["event"] == cls_name]
    plt.scatter(
        sub["rms_pu"], sub["thd_pct"],
        c=pt_colors[cls_name], marker=markers[cls_name],
        edgecolors="k", linewidth=0.6, s=42, alpha=0.88,
        label=f"{cls_name} (train)"
    )

plt.axhline(6.0, color="#7f1d1d", linestyle=":", linewidth=1.1, alpha=0.7, label="THD = 6% reference")
plt.xlim(rms_min, rms_max)
plt.ylim(thd_min, thd_max)
plt.xlabel("RMS Voltage (p.u.)", fontsize=11)
plt.ylabel("Voltage THD (%)", fontsize=11)
plt.title("F1: Power-Quality Event Decision Regions (Softmax Regression, C = 10)", fontsize=12, fontweight="bold")
plt.legend(loc="upper left", fontsize=9.5, framealpha=0.92)
plt.grid(True, linestyle="--", alpha=0.35)
plt.tight_layout()
plt.savefig("F1_regions.png")
plt.close()
print("\nSaved figure: F1_regions.png")


# ---------------------------------------------------------
# F2: Predicted Class Probabilities (3 d.p.)
# ---------------------------------------------------------
query_events = np.array([
    [0.97, 5.0],
    [0.84, 8.0]
])
raw_probs = model.predict_proba(query_events)
model_classes = list(model.named_steps["logisticregression"].classes_)
col_order = [model_classes.index(c) for c in table_classes]
ordered_probs = raw_probs[:, col_order]

print("\n--- F2: Predicted Class Probabilities (3 d.p.) ---")
print(f"{'Event':24s} | {'normal':>8s} {'sag':>8s} {'swell':>8s} {'harmonic':>8s}")
print("-" * 64)
for (rms_val, thd_val), p_row in zip(query_events, ordered_probs):
    ev_str = f"{rms_val:.2f} p.u., THD {thd_val:.1f} %"
    print(
        f"{ev_str:24s} | "
        f"{p_row[0]:8.3f} {p_row[1]:8.3f} {p_row[2]:8.3f} {p_row[3]:8.3f}"
    )


# ---------------------------------------------------------
# F3: Events in the whole file labelled 'sag' with THD > 6 %
# ---------------------------------------------------------
sag_high_thd = df[(df["event"] == "sag") & (df["thd_pct"] > 6.0)]
print("\n--- F3: Compound Sag + High-THD Events ---")
print(f"Number of events in whole file labelled 'sag' with THD > 6%: {len(sag_high_thd)}")
print(sag_high_thd.to_string(index=False))