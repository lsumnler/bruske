#! /usr/bin/env python

class node:
    def __init__(self):
        self.data = None
        self.next = None

class linked_list:
    def __init__(self):
        self.cur_node = None

    def add_node(self, data):
        new_node = node()
        new_node.data = data
        new_node.next = self.cur_node
        self.cur_node = new_node

    def list_print(self):
        node = ll.cur_node
        while node:
            print node.data, node.next
            node = node.next

    def insert_after(self, data, n_data):
        new_node = node()
        new_node.data = n_data
        new_node.next = data.next
        node.next = new_node

ll = linked_list()

ll.add_node(1)
ll.add_node(2)
ll.add_node(3)
ll.add_node(4)
ll.insert_after(2,9)

ll.list_print()
