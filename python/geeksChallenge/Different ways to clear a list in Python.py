#1
def clear(li,n):
    for i in range(0,n):
        li.pop()
    print(li)

print("Enter the length of the array")
n = int(input())
l = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    l.append(num)
clear(l,n)

#2
l2 = [10,20,30,40,50,60,70,80,90,100]
l2.clear()
print(l2)

#3
l3 = [10,20,30,40,50,60,70,80,90,100]
del l3[:]
print(l3)
