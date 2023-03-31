def sum_of_array(arr,n):
    sum = 0
    for i in range(0,n):
        sum = sum + arr[i]
    
    print("The sum of numbers in an array is ",sum)

print("Enter the length of the array")
n = int(input())
arr = []
print("Enter the array elements")
for i in range(0,n,1):
    num = int(input())
    arr.append(num)

sum_of_array(arr,n)
