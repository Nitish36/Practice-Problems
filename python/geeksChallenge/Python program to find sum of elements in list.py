def sums(li,n):
    sum = 0
    for i in range(n):
        sum = sum+li[i]
    
    print("The sum is ",sum)

print("Enter the length of the array")
n = int(input())
li = []
print("Enter the elements of the array")
for i in range(n):
    num = int(input())
    li.append(num)

sums(li,n)
