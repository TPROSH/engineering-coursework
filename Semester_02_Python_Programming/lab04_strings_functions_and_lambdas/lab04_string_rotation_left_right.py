#8 To rotate the given string by d elements in left or right direction.
string = "abcdefghi"
d = 3
s_left = string[d:]+string[:d]
s_right = string[-d:]+string[:-d]
print(f"left = {s_left}\nright = {s_right}")