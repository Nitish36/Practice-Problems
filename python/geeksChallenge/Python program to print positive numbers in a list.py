def pos_check(li):
    pos_li = []
    for i in range(len(li)):
        if li[i] > 0:
            pos_li.append(li[i])
    
    print(pos_li)

print("enter the length of the list")
n = int(input())
li = []
print("Enter {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)


pos_check(li)