#7 To find if a character is in string and split string into multiple words.
string = "mango ranger"

if 'a' in string:
    print("This character is in the string")
else:
    print("this character is not in this string")
string_2 = string.split(" ")
print("Updated string = ",string_2)