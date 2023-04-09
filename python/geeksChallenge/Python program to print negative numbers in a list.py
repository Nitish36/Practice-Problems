def neg_check(li):
    neg_li = []
    for i in range(len(li)):
        if li[i] < 0:
            neg_li.append(li[i])
    
    print(neg_li)

print("enter the length of the list")
n = int(input())
li = []
print("Enter {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)


neg_check(li)