def swap(li,n):
    temp = li[0]
    li[0] = li[n-1]
    li[n-1] = temp
    
    return li

def display(li,n):
    for i in range(n):
        print(li[i],end=' ')
    print("\n")
print("Enter the number of elements in the list")
n = int(input())
print("Enter the {} elements".format(n))
l = []
for i in range(n):
    num = int(input())
    l.append(num)

print("List before sqapping")
display(l,n)

print("List after swapping")
swap(l,n)
display(l,n)
