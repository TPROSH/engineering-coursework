def print_list(head):
    curr = head
    result = []
    while curr:
        result.append(str(curr["data"]))
        curr = curr["next"]
    print(" -> ".join(result) if result else "List is empty")

def move_node_to_beginning(head, key):
    if not head or head["data"] == key:
        return head

    prev = None
    curr = head
    while curr and curr["data"] != key:
        prev = curr
        curr = curr["next"]

    # If key was not found
    if not curr:
        print(f"Value {key} not found in the list.")
        return head

    # Detach curr
    prev["next"] = curr["next"]
    # Place curr at beginning
    curr["next"] = head
    return curr

# Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}
head = node1

print("Original List:")
print_list(head)

# Move node with data 40 to front
head = move_node_to_beginning(head, 40)
print("\nAfter moving 40 to beginning:")
print_list(head)