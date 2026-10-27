#To get user information and calculate its BMI

name = input("Enter user's name = ")
age = float(input("Enter user's age = "))
height = float(input("Enter user's height in metres = "))
weight = float(input("Enter user's Weight in KG = "))
BMI = weight/(height*height)

print(f"User name = {name}\nUser's age = {age}\nUser's height = {height}\nUser's Weight = {weight}\nBMI = {BMI}")

if BMI<18.5:
    print("User is underweight.")
elif BMI>= 18.5 and BMI <= 24.9:
    print("User is Healthy.")
elif BMI>= 25 and BMI <= 29.9:
    print("User is overweight.")
elif BMI >= 30:
    print("User is obese.")
else:
    print("User is from mars.")