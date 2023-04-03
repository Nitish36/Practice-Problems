def minimum(li,n):
    min = li[0]
    for i in range(n):
        if li[i]<min:
            min = li[i]
    
    print("The minimum element is ",min)
    

print("Enter the length of the array")
n = int(input())
li = []
print("Enter the elements of the array")
for i in range(n):
    num = int(input())
    li.append(num)

minimum(li,n)
