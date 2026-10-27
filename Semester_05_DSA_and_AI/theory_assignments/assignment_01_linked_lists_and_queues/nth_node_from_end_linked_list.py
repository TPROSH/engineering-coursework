# Write and Implement a program to print the nth position node from the end of
# the singly linked list.

#Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}

# Head pointer points to the first node
head = node1

# Print the list to verify structure
print("Linked List:")
lol = head
while lol["next"] is not None:
    print(lol["data"], end=" -> ")
    lol = lol["next"]
print("None\n")

# the elements number we want from the end of list
n = 2

fast_ptr = head
slow_ptr = head

# Moving fast_ptr n steps ahead
count = 0
while count < n and fast_ptr is not None:
    fast_ptr = fast_ptr["next"]
    count = count + 1

# Checking if n is larger than the list length
if count < n:
    print(f"Error: The list has fewer than {n} nodes.")
else:
    while fast_ptr is not None:
        fast_ptr = fast_ptr["next"]
        slow_ptr = slow_ptr["next"]

    # slow_ptr now rests on the target node
    print(f"The {n}-th node from the end is: {slow_ptr['data']}")