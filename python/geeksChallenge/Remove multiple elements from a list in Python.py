def delete(li):
    for i in list(li):
        li.remove(i)
        print("Element Removed !!")
    if(len(li) == 0):
        print("List is empty")
        exit(0)

print("Enter the length of the list")
n = int(input())
l = []
print("Enter the {} elements".format(n))
for i in range(n):
    num  = int(input())
    l.append(num)

while(True):
    delete(l)