def create_dnode(data, prev_node=None, next_node=None):
    return {"data": data, "prev": prev_node, "next": next_node}

def print_forward(head):
    curr = head
    elements = []
    while curr:
        elements.append(str(curr["data"]))
        curr = curr["next"]
    print(" <-> ".join(elements) if elements else "List is empty")

def insert_front(head, data):
    new_node = create_dnode(data, None, head)
    if head:
        head["prev"] = new_node
    return new_node

def insert_end(head, data):
    new_node = create_dnode(data)
    if not head:
        return new_node
    curr = head
    while curr["next"]:
        curr = curr["next"]
    curr["next"] = new_node
    new_node["prev"] = curr
    return head

def delete_node(head, key):
    curr = head
    while curr and curr["data"] != key:
        curr = curr["next"]
    if not curr:
        return head
    if curr["prev"]:
        curr["prev"]["next"] = curr["next"]
    else:
        head = curr["next"]
    if curr["next"]:
        curr["next"]["prev"] = curr["prev"]
    return head

# Hardcoded Doubly Linked List
dnode5 = {"data": 50, "prev": None, "next": None}
dnode4 = {"data": 40, "prev": None, "next": dnode5}
dnode3 = {"data": 30, "prev": None, "next": dnode4}
dnode2 = {"data": 20, "prev": None, "next": dnode3}
dnode1 = {"data": 10, "prev": None, "next": dnode2}

# Linking backwards
dnode5["prev"] = dnode4
dnode4["prev"] = dnode3
dnode3["prev"] = dnode2
dnode2["prev"] = dnode1
head = dnode1

print("Initial Doubly Linked List:")
print_forward(head)

head = insert_front(head, 5)
head = insert_end(head, 60)
print("\nAfter Insertions:")
print_forward(head)

head = delete_node(head, 30)
print("\nAfter Deleting 30:")
print_forward(head)