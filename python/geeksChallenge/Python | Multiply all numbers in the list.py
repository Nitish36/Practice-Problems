def prod(li,n):
    prod = 1
    for i in range(n):
        prod = prod*li[i]
    
    print("The product is ",prod)

print("Enter the length of the array")
n = int(input())
li = []
print("Enter the elements of the array")
for i in range(n):
    num = int(input())
    li.append(num)

prod(li,n)
