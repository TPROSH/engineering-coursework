#9 to take a sentence as input.
# 1. convert it to uppercase.
# 2. Find total number of characters.
# 3. replace all occurence of python with programming.

string = str(input("Enter a string which contains python = "))
string = string.upper()
print("Converting string to uppercase = ",string)
print("Total number of charcters = ",len(string))
print("replacing all occurence of python with programming = ",string.replace("PYTHON","PROGRAMMING"))