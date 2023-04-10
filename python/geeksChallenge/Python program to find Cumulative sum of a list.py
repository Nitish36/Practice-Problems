def cumulative(li):
    cum_li = []
    sum = 0
    for i in li:
        sum = sum+i
        cum_li.append(sum)
    print("The cumulative list sum is {}".format(cum_li))

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    li.append(num)
cumulative(li)
