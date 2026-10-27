def create_node(data, next_node=None):
    return {"data": data, "next": next_node}

# 1. Traversal
def traverse(head):
    curr = head
    elements = []
    while curr:
        elements.append(str(curr["data"]))
        curr = curr["next"]
    print(" -> ".join(elements) if elements else "List is empty")

# 2. Ordered Insert
def insert_sorted(head, data):
    new_node = create_node(data)
    if not head or head["data"] >= data:
        new_node["next"] = head
        return new_node
    curr = head
    while curr["next"] and curr["next"]["data"] < data:
        curr = curr["next"]
    new_node["next"] = curr["next"]
    curr["next"] = new_node
    return head

# 3. Delete by value
def delete_value(head, key):
    if not head:
        return None
    if head["data"] == key:
        return head["next"]
    curr = head
    while curr["next"] and curr["next"]["data"] != key:
        curr = curr["next"]
    if curr["next"]:
        curr["next"] = curr["next"]["next"]
    return head

# 4. Search
def search(head, key):
    curr = head
    pos = 1
    while curr:
        if curr["data"] == key:
            return pos
        curr = curr["next"]
        pos += 1
    return -1

# Nodes defined in singly linked list (Ascending order)
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}
head = node1

print("Initial Sorted List:")
traverse(head)

print("\n1. Insert 25:")
head = insert_sorted(head, 25)
traverse(head)

print("\n2. Delete 40:")
head = delete_value(head, 40)
traverse(head)

print("\n3. Search for 25 and 40:")
print(f"25 found at position: {search(head, 25)}")
print(f"40 found at position: {search(head, 40)}")