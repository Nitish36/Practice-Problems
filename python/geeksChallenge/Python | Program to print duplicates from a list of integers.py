def occurance(li):
    dup_li = []
    for i in range(len(li)-1):
        for j in range(i+1,len(li)):
            if li[i] == li[j]:
                dup_li.append(li[i])
        
    print("The duplicates in the list is {}".format(dup_li))

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)
occurance(li)
