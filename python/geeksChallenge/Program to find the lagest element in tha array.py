def largest_of_array(arr,n):
    largest = arr[0]
    for i in range(0,n,1):
        if(arr[i]>largest):
            largest = arr[i]
        
    print("The largest element in the array is ",largest)

print("Enter the length of the array")
n = int(input())
arr = []
print("Enter the array elements")
for i in range(0,n,1):
    num = int(input())
    arr.append(num)

largest_of_array(arr,n)
