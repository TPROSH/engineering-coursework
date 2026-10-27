# Node Helper Function
def create_node(data, next_node=None):
    return {"data": data, "next": next_node}

def print_list(head):
    curr = head
    result = []
    while curr:
        result.append(str(curr["data"]))
        curr = curr["next"]
    print(" -> ".join(result) if result else "List is empty")

def insert_beginning(head, data):
    return create_node(data, head)

def insert_end(head, data):
    new_node = create_node(data)
    if not head:
        return new_node
    curr = head
    while curr["next"]:
        curr = curr["next"]
    curr["next"] = new_node
    return head

def insert_middle(head, data, position):
    # Inserts after 1-based index `position`
    if position <= 0 or not head:
        return insert_beginning(head, data)
    curr = head
    count = 1
    while curr and count < position:
        curr = curr["next"]
        count += 1
    if not curr:
        return head
    new_node = create_node(data, curr["next"])
    curr["next"] = new_node
    return head

def delete_beginning(head):
    if not head:
        return None
    return head["next"]

def delete_end(head):
    if not head or not head["next"]:
        return None
    curr = head
    while curr["next"]["next"]:
        curr = curr["next"]
    curr["next"] = None
    return head

def delete_middle(head, position):
    # Deletes node at 1-based index `position`
    if not head:
        return None
    if position == 1:
        return head["next"]
    curr = head
    count = 1
    while curr["next"] and count < position - 1:
        curr = curr["next"]
        count += 1
    if curr["next"]:
        curr["next"] = curr["next"]["next"]
    return head

# Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}
head = node1

print("Initial List:")
print_list(head)

head = insert_beginning(head, 5)
head = insert_middle(head, 25, 3)
head = insert_end(head, 60)
print("\nAfter Insertions:")
print_list(head)

head = delete_beginning(head)
head = delete_middle(head, 3)
head = delete_end(head)
print("\nAfter Deletions:")
print_list(head)