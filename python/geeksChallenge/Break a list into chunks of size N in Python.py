def slice_list(li):
    res_li = []
    for i in range(0,len(li),1):
        x = 1
        res_li.append(li[x:x+i])
    
    return res_li 

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)
print(slice_list(li))
