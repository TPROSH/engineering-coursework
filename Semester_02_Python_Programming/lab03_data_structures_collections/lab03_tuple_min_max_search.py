#11 to demonstrate working of Maximum and Minimum of elements in Tuple.
t = (5, 20, 3, 7, 6, 8)
t = tuple(sorted(t))

d1 = t[:2]
d2 = t[-2:]

print(d1 + d2)