def print_linked_list(head):
    current_node = head
    while current_node != None:
        print(current_node.value)
        current_node = current_node.next

def create_linked_list(input_list):
    """
    Function to create a linked list
    @param input_list: a list of integers
    @return: head node of the linked list
    """
    head = None
    tail = None
    for item in input_list:
        n = Node(item)
        if head == None:
            head = n
            tail = head
        else:
            tail.next = n
            tail = tail.next

    return head

class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

# class LinkedList:
#     def __init__(self):
#         self.head = None
        
#     def append(self, value):
#         if self.head is None:
#             self.head = Node(value)
#             return
        
#         # Move to the tail (the last node)
#         node = self.head
#         while node.next:
#             node = node.next
        
#         node.next = Node(value)
#         return

#     def to_list(self):
#         current = self.head
#         node_list = []
#         while current != None:
#             node_list.append(current.value)
#             current = current.next

#         return node_list

# linked_list = LinkedList()
# linked_list.append(1)
# linked_list.append(2)
# linked_list.append(4)

# node = linked_list.head
# while node:
#     print(node.value)
#     node = node.next

# nl = linked_list.to_list()
# print(nl)  

class DoubleNode:
    def __init__(self, value):
        self.value = value
        self.next = None
        self.previous = None

class DoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        

    def append(self, value):
        new_node = DoubleNode(value)
        if self.head == None:
            self.head = new_node
            self.tail = new_node
        else:
            new_node.previous = self.tail
            self.tail.next = new_node
            self.tail = new_node

# linked_list = DoublyLinkedList()
# linked_list.append(1)
# linked_list.append(-2)
# linked_list.append(4)

# print("Going forward through the list, should print 1, -2, 4")
# node = linked_list.head
# while node:
#     print(node.value)
#     node = node.next

# print("\nGoing backward through the list, should print 4, -2, 1")
# node = linked_list.tail
# while node:
#     print(node.value)
#     node = node.previous

class LinkedList:
    def __init__(self):
        self.head = None
        
    def prepend(self, value):
        """ Prepend a value to the beginning of the list. """
        
        new_node = Node(value)
        if self.head == None:
            self.head = new_node
        else:
            new_node.next = self.head
            self.head = new_node
    
    def append(self, value):
        """ Append a value to the end of the list. """
        
        new_node = Node(value)
        if self.head == None:
            self.head = new_node
        else:
            current = self.head
            while current.next != None:
                current = current.next

            current.next = new_node
    
    def search(self, value):
        """ Search the linked list for a node with the requested value and return the node. """
        
        current = self.head
        while current and current.value != value:
            current = current.next
        
        
        return current
    
    def remove(self, value):
        """ Remove first occurrence of value. """

        current = self.head
        previous = None
        while current and current.value != value:
            previous = current
            current = current.next

        if current:
            # Found the node to delete
            if previous:
                previous.next = current.next
            else:
                self.head = current.next

    
    def pop(self):
        """ Return the first node's value and remove it from the list. """
        if not self.head:
            return None

        value = self.head.value
        self.head = self.head.next

        return value

    def insert(self, value, pos):
        """ Insert value at pos position in the list. If pos is larger than the
            length of the list, append to the end of the list. """
        
        new_node = Node(value)
        if pos == 0:
            new_node.next = self.head
            self.head = new_node
            return

        current_pos = 0
        current = self.head
        previous = None
        while current != None: # and current_pos < pos:
            print("current", current_pos)
            if current_pos == pos:
                new_node.next = current_pos
                previous = new_node
                print("returning")
                return

            current_pos += 1
            previous = current_pos
            current = current.next

        # append at the end
        # new_node.next = current.next
        # current.next = new_node        
    
    def size(self):
        """ Return the size or length of the linked list. """
        
        current = self.head
        size = 0
        while current:
            current = current.next
            size += 1

        return size

    def to_list(self):
        out = []
        node = self.head
        while node:
            out.append(node.value)
            node = node.next
        return out

linked_list = LinkedList()
linked_list.append(1)
linked_list.append(2)
linked_list.append(4)
linked_list.prepend(0)

print_linked_list(linked_list.head)

n = linked_list.search(99)
if n != None:
    print("value", n.value)

print('\n')

print("size ", linked_list.size())

print('\n')

linked_list.insert(3, 1)


# linked_list.remove(99)
# linked_list.remove(1)
# linked_list.remove(2)
# linked_list.remove(4)

# linked_list.pop()
# linked_list.pop()
# linked_list.pop()
# linked_list.pop()
print_linked_list(linked_list.head)
