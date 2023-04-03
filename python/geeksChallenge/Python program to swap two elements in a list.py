def display(li,n):
    for i in range(n):
        print(li[i],end=" ")
def display_swapped(li,n):
    for i in range(0,n-1,2):
        li[i],li[i+1] = li[i+1],li[i]
    
    print(li)

print("Enter the total number of elements in the list")
n = int(input())
print("Enter the {} elements".format(n))
li = []
for i in range(n):
    num = int(input())
    li.append(num)

print("The list before swapping")
display(li,n)
print("The list after swapping")
display_swapped(li,n)
