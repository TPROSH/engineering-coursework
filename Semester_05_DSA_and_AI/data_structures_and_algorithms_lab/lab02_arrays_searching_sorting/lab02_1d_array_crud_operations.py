# Write a program to implement 1D array. Apply basic
# operations such as create, insert, delete, and traverse on it.

# 1. CREATE
n = int(input("Number of elements in array = "))
B = [0] * n
for i in range(n):
    B[i] = int(input(f"Enter element {i+1} = "))
print("Created array:", B)


# 2. INSERT
C = int(input("\nEnter the element you want to insert = "))
D = int(input(f"Enter index to insert at (0 to {len(B)}) = "))

if 0 <= D <= len(B):
    B = B + [0]  # Expand array by 1 slot
    for i in range(len(B) - 1, D, -1):
        B[i] = B[i - 1]  # Shift right
    B[D] = C
    print("Array after insertion:", B)
else:
    print("Invalid index! Insertion skipped.")


# 3. DELETE (by value)
rem = int(input("\nEnter the element you want to delete = "))
target_index = -1

# Search for the element
for i in range(len(B)):
    if B[i] == rem:
        target_index = i
        break

# Shift left only if found
if target_index != -1:
    for i in range(target_index, len(B) - 1):
        B[i] = B[i + 1]  # Shift left
    B = B[:-1]  # Trim redundant last slot
    print("Array after deletion:", B)
else:
    print(f"Element {rem} not found in array. No element deleted.")


# 4. TRAVERSE
print("\nTraversing elements:")
for i in range(len(B)):
    print(f"Index {i} -> {B[i]}")