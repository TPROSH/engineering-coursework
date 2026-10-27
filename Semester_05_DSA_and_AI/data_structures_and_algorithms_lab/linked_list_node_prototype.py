class Node:
    def __init__(abc, data, next=None):
        abc.chiz = data
        abc.agla = next

class LinkedList:
    def create_list():
        return Node(10, Node(20, Node(30)))

    # Display linked list
    def print_list(my):
        head = my
        while my.agla is not None:
            print(my.chiz, "->", end=" ")
            my = my.agla
        print("None")

ll = LinkedList()
my = ll.create_list()
