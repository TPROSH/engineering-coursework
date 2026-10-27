# Write and implement program for the Queue operations using Singly Linked List.

#Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}

print("Linked List before any queue operation = ")
lol = node1
while lol is not None:
    print(lol["data"],"->", end=" ")
    lol = lol["next"]
print("None\n")

#Dequeue
node1 = node1["next"]
print("Linked List after Dequeue = ")
lol = node1
while lol["next"] is not None:
    print(lol["data"],"->", end=" ")
    lol = lol["next"]
print("None\n")

#enqueue
new_node = {"data": 60, "next":None}
lol = node1
count = 0
while lol["next"] is not None:
    lol = lol["next"]
else:
    lol["next"] = new_node

print("Linked List after Enqueue = ")
lol = node1
while lol is not None:
    print(lol["data"],"->", end=" ")
    lol = lol["next"]
print("None\n")