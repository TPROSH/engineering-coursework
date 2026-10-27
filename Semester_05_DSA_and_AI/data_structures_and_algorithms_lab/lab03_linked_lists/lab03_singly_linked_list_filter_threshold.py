def print_list(head):
    curr = head
    result = []
    while curr:
        result.append(str(curr["data"]))
        curr = curr["next"]
    print(" -> ".join(result) if result else "List is empty")

def delete_greater_or_equal(head, threshold):
    # Remove eligible nodes from the head
    while head and head["data"] >= threshold:
        head = head["next"]

    curr = head
    while curr and curr["next"]:
        if curr["next"]["data"] >= threshold:
            curr["next"] = curr["next"]["next"]
        else:
            curr = curr["next"]
    return head

# Nodes defined in singly linked list
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}
head = node1

print("Original List:")
print_list(head)

threshold = int(input("Enter threshold value (nodes >= threshold will be deleted): "))
head = delete_greater_or_equal(head, threshold)

print(f"\nList after deleting nodes >= {threshold}:")
print_list(head)