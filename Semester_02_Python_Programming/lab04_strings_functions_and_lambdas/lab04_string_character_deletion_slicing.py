#6 To delete 3rd and 2nd last character of the string "hello world".
string = "hello world"
print("string after deleting 3rd and 2nd last character = ",string[:2]+string[3:-2]+string[-1:])