#passoword authentication system with the use of while loop

user = {"anshul" :"123456789", "atulya": "qwerty"}
count = 0
user_id = input("Enter user's ID = ")
user_pass = input("Enter user's password = ")

run = True
while run == True:
    if (user[user_id]==user_pass):
       print("Access Granted.")
       break
    else:
        count += 1
        if count<=3:
            print("Wrong password.\nReverify.")
            user_pass = input("Enter user's password = ")
            if (user[user_id]==user_pass):
                print("Access Granted.")
                break
        else:
            print("Your file is locked.\nTry again after 2 hours.")
            break