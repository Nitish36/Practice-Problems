def copy(li):
    dup_list = []
    for i in range(len(li)):
        dup_list.append(li[i])
    
    print("Duplicate list")
    print(dup_list)

print("Enter the lenght of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)

print("Original List")
print(li)
copy(li)