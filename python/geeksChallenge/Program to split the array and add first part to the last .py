def split_arr(arr,n,pos):
    for i in range(pos):
        x = arr[0]
        for j in range(n-1):
            arr[j] = arr[j+1]
        arr[n-1] = x

def display(arr,n):
    for i in range(n):
        print(arr[i]," ")

print("Enter the length of the array")
n = int(input())
arr = []
print("Enter the array elements")
for i in range(n):
    num = int(input())
    arr.append(num)

print("Enter the position of splitting")
pos = int(input())
split_arr(arr,n,pos)
display(arr,n)
