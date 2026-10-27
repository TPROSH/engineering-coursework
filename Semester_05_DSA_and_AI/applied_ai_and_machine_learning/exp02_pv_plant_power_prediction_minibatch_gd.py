
GSV_BENCH_REF = "VDR-0712"

print("Bench reference: VDR-0712")

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==================================================
# Load data
# ==================================================
df = pd.read_csv("data/B_pv_plant.csv")

G = df["irradiance_Wm2"].to_numpy(dtype=float)
Tm = df["module_temp_C"].to_numpy(dtype=float)
y = df["ac_power_kW"].to_numpy(dtype=float)
m = len(y)

X_raw = np.column_stack((np.ones(m), G, Tm))


def mse(X, y, theta):
    return np.mean((X @ theta - y) ** 2)


def grad(X, y, theta):
    return (2 / len(y)) * X.T @ (X @ theta - y)


def hessian(X):
    return (2 / len(X)) * X.T @ X


def standardise(G, Tm):
    means = np.array([np.mean(G), np.mean(Tm)])
    stds = np.array([np.std(G, ddof=0), np.std(Tm, ddof=0)])
    Z = np.column_stack(((G - means[0]) / stds[0],
                         (Tm - means[1]) / stds[1]))
    return np.column_stack((np.ones(len(G)), Z)), means, stds


def batch_gd(X, y, eta, theta_star, max_iter=200000):
    theta = np.zeros(X.shape[1])
    J0 = mse(X, y, theta)
    Jstar = mse(X, y, theta_star)

    if J0 == 0:
        return theta, 0, "not converged", mse(X, y, theta)

    for iteration in range(1, max_iter + 1):
        theta -= eta * grad(X, y, theta)
        J = mse(X, y, theta)

        if not np.isfinite(J) or J > 1e6 * J0:
            return theta, iteration, "diverged", J

        if Jstar > 0 and (J - Jstar) / Jstar < 1e-6:
            return theta, iteration, "converged", J

    return theta, max_iter, "not converged", mse(X, y, theta)


# ==================================================
# B1 — Closed-form solution
# ==================================================
theta_star = np.linalg.lstsq(X_raw, y, rcond=None)[0]
Jstar = mse(X_raw, y, theta_star)

print("\nB1 — Closed-form solution")
print(f"theta0* = {theta_star[0]:.4f} kW")
print(f"theta1* = {theta_star[1]:.6f}")
print(f"theta2* = {theta_star[2]:.6f}")
print(f"J* = {Jstar:.6f} kW^2")


# ==================================================
# B2 — Hessian and gradient descent
# ==================================================
X_std, means, stds = standardise(G, Tm)
theta_std_star = np.linalg.lstsq(X_std, y, rcond=None)[0]
Jstar_std = mse(X_std, y, theta_std_star)


def report_hessian(label, X, theta_star_local):
    H = hessian(X)
    eigenvalues = np.linalg.eigvalsh(H)
    lam_min = eigenvalues[0]
    lam_max = eigenvalues[-1]
    condition = lam_max / lam_min if lam_min > 0 else np.inf
    stability = 2 / lam_max

    theta, iters, status, Jfinal = batch_gd(
        X, y, 1 / lam_max, theta_star_local
    )

    print(f"\n{label}")
    print("Eigenvalues:", [f"{v:.3g}" for v in eigenvalues])
    print(f"Condition number = {condition:.3g}")
    print(f"Stability limit = {stability:.3g}")
    print(f"Iterations = {iters}")
    print(f"Status = {status}")

    if status == "not converged":
        print("Relative MSE gap =",
              (Jfinal - mse(X, y, theta_star_local)) /
              mse(X, y, theta_star_local))

    return H, lam_max


H_raw, lam_raw = report_hessian("B2 — Raw inputs", X_raw, theta_star)
H_std, lam_std = report_hessian(
    "B2 — Standardised inputs", X_std, theta_std_star
)


# ==================================================
# B3 — Convert standardised coefficients to raw units
# ==================================================
theta_std_to_raw = np.empty(3)
theta_std_to_raw[1] = theta_std_star[1] / stds[0]
theta_std_to_raw[2] = theta_std_star[2] / stds[1]
theta_std_to_raw[0] = (
    theta_std_star[0]
    - theta_std_star[1] * means[0] / stds[0]
    - theta_std_star[2] * means[1] / stds[1]
)

print("\nB3 — Standardised coefficients converted to raw units")
print("Converted coefficients:", theta_std_to_raw)
print("Closed-form raw coefficients:", theta_star)
print("Largest absolute difference:",
      np.max(np.abs(theta_std_to_raw - theta_star)))


# ==================================================
# B4 — Learning-rate sweep
# ==================================================
print("\nB4 — Learning-rate sweep on standardised inputs")
for k in [0.1, 0.5, 0.99, 1.01]:
    eta = k * (2 / lam_std)
    theta, iters, status, Jfinal = batch_gd(
        X_std, y, eta, theta_std_star
    )
    print(f"k={k:.2f}, eta={eta:.3g}, "
          f"status={status}, iterations={iters}")


# ==================================================
# B5 — Mini-batch gradient descent
# ==================================================
def minibatch_gd(X, y, theta_star, schedule, epochs=20):
    rng = np.random.default_rng(0)
    theta = np.zeros(X.shape[1])
    t = 0
    distances = []

    for epoch in range(epochs):
        idx = rng.permutation(len(y))

        for start in range(0, len(y), 32):
            batch = idx[start:start + 32]
            eta = schedule(t)
            theta -= eta * grad(X[batch], y[batch], theta)
            t += 1

        distances.append(np.linalg.norm(theta - theta_star))

    return np.array(distances)


required_schedule = lambda t: 5 / (t + 50)
custom_schedule = lambda t: 1 / (t + 10)

dist_required = minibatch_gd(
    X_std, y, theta_std_star, required_schedule
)
dist_custom = minibatch_gd(
    X_std, y, theta_std_star, custom_schedule
)

print("\nB5 — Distance from standardised closed-form solution")
print("Schedule: eta_t = 5/(t+50)")
for epoch in [1, 5, 20]:
    print(f"After {epoch} epoch(s): {dist_required[epoch-1]:.4g}")

print("Custom schedule: eta_t = 1/(t+10)")
for epoch in [1, 5, 20]:
    print(f"After {epoch} epoch(s): {dist_custom[epoch-1]:.4g}")

plt.figure()
plt.plot(np.arange(1, 21), dist_required, label="5/(t+50)")
plt.plot(np.arange(1, 21), dist_custom, label="1/(t+10)")
plt.xlabel("Epoch")
plt.ylabel("Distance to closed-form solution")
plt.title("B5 Mini-batch Gradient Descent")
plt.legend()
plt.tight_layout()
plt.savefig("B5_minibatch.png", dpi=150)
plt.close()

print("Saved plot: B5_minibatch.png")

