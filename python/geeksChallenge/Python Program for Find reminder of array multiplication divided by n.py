def rem(arr,n):
    prod = 1
    for i in range(n):
        prod = prod*arr[i]
    
    remainder = prod%n
    
    return remainder

print("Enter the length of the array")
n = int(input())
arr = []
for i in range(n):
    num = int(input())
    arr.append(num)

print("The remainder of the product of the array is ",rem(arr,n))
