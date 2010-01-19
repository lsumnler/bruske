'''
Created on Oct 23, 2009

@author: lenyel
'''

#!/usr/bin/python

class MyAdd(object):
    def __init__(self, a, b):
        
        print a + b

class MyAdd2(object):
    def __init__(self, a, b):
        self.a = a
        self.b = b
        self.total = self.a + self.b
        
class MyMath(object):
    pow = 3
    def __init__(self):
        pass
    
    def mymulti(self, op1, op2):
        self.op1 = op1
        self.op2 = op2
        self.multi = self.op1 * self.op2
        
    def mypow(self):
        self.multi ** pow
if __name__ == '__main__':
    test = MyAdd(1,2)
    
    test2 = MyAdd2(4,5)
    print test2.a, test2.b
    print test2.total
    
    test3 = MyMath()
    print test3.mymulti(2,3)
    print test3.mypow()