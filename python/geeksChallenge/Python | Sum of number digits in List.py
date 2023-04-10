def add(num):
    sum = 0
    while num>0:
        rem = num%10
        sum = sum + rem
        num = num // 10
    
    return sum

def list_sum(li):
    summed_li = []
    for i in range(len(li)):
        ele = add(li[i])
        summed_li.append(ele)
    
    print("Final list is {}".format(summed_li))

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)
list_sum(li)
