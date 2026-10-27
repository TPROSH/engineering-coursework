def print_list(head):
    curr = head
    result = []
    while curr:
        result.append(str(curr["data"]))
        curr = curr["next"]
    print(" -> ".join(result) if result else "List is empty")

def join_lists(head1, head2):
    if not head1:
        return head2
    curr = head1
    while curr["next"]:
        curr = curr["next"]
    curr["next"] = head2
    return head1

# First List
node5 = {"data": 50, "next": None}
node4 = {"data": 40, "next": node5}
node3 = {"data": 30, "next": node4}
node2 = {"data": 20, "next": node3}
node1 = {"data": 10, "next": node2}
head1 = node1

# Second List
list2_node3 = {"data": 80, "next": None}
list2_node2 = {"data": 70, "next": list2_node3}
list2_node1 = {"data": 60, "next": list2_node2}
head2 = list2_node1

print("List 1:")
print_list(head1)

print("\nList 2:")
print_list(head2)

joined_head = join_lists(head1, head2)
print("\nJoined List:")
print_list(joined_head)