#14 to show the use of A ⋃ B Union operation and A ⋂ B-Intersection Operation.
a = {1,2,3,4,5,6}
b = {4,5,6,7,8,9}

print(f"A ⋃ B = {a.union(b)}\nA ⋂ B = {a.intersection(b)}")
print(f"A ⋃ B = {a|b}\nA ⋂ B = {a&b}")