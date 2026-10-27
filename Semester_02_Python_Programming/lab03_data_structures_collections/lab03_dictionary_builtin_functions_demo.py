#18 to show the effect of varius functions in a dictionary
d = {1:'blue',2:'green',3:'yellow',4:'red',5:'white'}
print("current dictionary = ",d)
d.pop(3)
print("updated dictionary = ",d)
upd = {3:'black'}
d.update(upd)
print("updated dictionary = ",d)
print("Keys = ",d.keys())
print("values = ",d.values())

print("value of 3rd key = ",d.get(3))
print("Last inserted key and value = ",d.popitem())
dd = d.copy()
print("copied dictyionary = ",dd)
d.clear()
print("updated dictionary = ",d)