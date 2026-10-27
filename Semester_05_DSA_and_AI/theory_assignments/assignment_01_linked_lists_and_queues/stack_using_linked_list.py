# Write and implement program for the stack operations using Singly Linked List.

#Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}

print("Linked List before any stack operation = ")
lol = node1
while lol["next"] is not None:
    print(lol["data"],"->", end=" ")
    lol = lol["next"]
print("None\n")


#To push
new_node = {"data":5, "next":node1}
print("Linked List after push = ")
lol = new_node
while lol["next"] is not None:
    print(lol["data"],"->", end=" ")
    lol = lol["next"]
print("None\n")

#To pop
new_node = new_node["next"]
print("Linked list after pop = ")
lol = new_node
while lol["next"] is not None:
    print(lol["data"],"->",end=" ")
    lol = lol["next"]
print("None\n")

# TOp
lol = node1
print(lol["data"])