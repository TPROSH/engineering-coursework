# Write and implement program for the Circular Queue.

size = 5
q = [None]*size
rear = 0
front = 0

def enqueue(val):
    global rear
    if q[rear] is not None:
        print("Queue is full")
        return
    q[rear] = val
    rear+=1
    if rear == size:
        rear = 0
    print(q)

def dequeue():
    global front
    if q[front] is None:
        print("No Elements to remove")
        return
    q[front] = None
    front+=1
    if front == size:
        front = 0
    print(q)


enqueue(10)
enqueue(878)
enqueue(54)
enqueue(99)
enqueue(4879)
enqueue(65)
dequeue()
