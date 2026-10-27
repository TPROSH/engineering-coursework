#bubble sort

i = 0
arr = [7, 2, 9, 4, 1, 8, 5, 3, 6]
n = len(arr)

while i < n - 1:
    if arr[i] > arr[i + 1]:
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        i = 0
    else:
        i += 1

print(arr)