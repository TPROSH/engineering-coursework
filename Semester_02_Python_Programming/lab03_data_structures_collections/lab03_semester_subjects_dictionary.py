#15 to Create a dictionary with number of subject study in the present semester and perform the operation like add and remove the elements from the created dictionary.
d = {1:'Eng Physics',2:'Eng Mathematics',3:'CP Python',4:'IMCE',5:'IMTE'}
upd = {6:'Eng Mechanics'}
d.pop(2)
d.update(upd)
print("Dictionary = ",d)