def arr_roataion(arr,n):
    
    num = arr[0]
    for j in range(0,n-1,1):
        arr[j] = arr[j+1]
    arr[len(arr)-1] = num    
    return arr

print("Enter the length of the array")
n = int(input())
arr = []
for i in range(n):
    ele = int(input())
    arr.append(ele)

rot_arr = arr_roataion(arr,n)
print("Rotated array is {}".format(rot_arr))
