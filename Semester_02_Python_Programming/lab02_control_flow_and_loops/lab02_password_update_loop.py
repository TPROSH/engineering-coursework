#code to update social media passoword with the use of while loop

password = 'anshul'
upd = input("Enter a new password to update your old one = ")
i = 0
while i == 0:
    rev = input('Reverify your password again = ')
    if upd == rev :
        print(f"Your password is updated from {password} to {upd}")
        password = upd
        i = 1