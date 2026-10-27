def List():
    L = ['Red','Blue','Green','Yellow']
    print("Current List = ",L)
    c = 'White'
    L.append(c)
    print("Adding a new Color to the list......")
    print("List after adding a color 'White' = ",L)
    print("Removing the Second Color from the list......")
    L.pop(1)
    print("New updated List after removing the Second color = ",L)

def Tuple():
    T = ('Red','Blue','Green','Yellow')
 #   T[1]='White' (tuple object does not support item assignment error)
    print("\nTuple = ",T)

def Dictionary():
    D = {1:'Red',2:'Blue',3:'Green',4:'Yellow'}
    print("\nDictionary Created = ",D)
    updates = {2:'White'}
    D.update(updates)
    print("Updated Dictionary = ",D)

def Set():
    S = {'Red','Blue','Green','Yellow'}
    print("\nCurrent Set = ",S)
    c = 'White'
    S.add(c)
    print("Adding a new Color to the set......")
    print("Set after adding a color 'White' = ",S)
    d = 'White'
    S.add(d)
    #nothing happened
    print("Adding a duplicate Color to the set......")
    print("Set after adding a color 'White' again = ",S,"\nNo changes")
    
def Ques9():
    List()
    Tuple()
    Dictionary()
    Set()
Ques9()