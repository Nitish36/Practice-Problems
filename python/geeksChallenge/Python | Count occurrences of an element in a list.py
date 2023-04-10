def occurance(li,key):
    ctr = 0
    
    for i in range(len(li)):
        if li[i] == key:
            ctr = ctr + 1
        
    print("The occurance of {} in the list is {}".format(key,ctr))

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)
print("Enter the key element to be searched")
key = int(input())

occurance(li,key)
