#Input time in hours and minutes , converts into seconds

hours = int(input("Enter number of hours:- "))
minute = int(input("Enter number of minutes:- "))
print(f"Total seconds = {(hours*3600)+(minute*60)}")

c = (hours*3600)+(minute*60)

print(f"Total seconds = {c}")