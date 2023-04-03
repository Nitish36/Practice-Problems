def maximum(li,n):
    max = li[0]
    for i in range(n):
        if li[i]>max:
            max = li[i]
    
    print("The minimum element is ",max)
    

print("Enter the length of the array")
n = int(input())
li = []
print("Enter the elements of the array")
for i in range(n):
    num = int(input())
    li.append(num)

maximum(li,n)
