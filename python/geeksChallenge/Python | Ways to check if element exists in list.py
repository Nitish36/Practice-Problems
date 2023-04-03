def search(li,n,key):
    for i in range(0,n):
        if key == li[i]:
            return True
    return False

print("Enter the length of the array")
n = int(input())
l = []
print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    l.append(num)

print("Enter the key to be searched")
key = int(input())

if(search(l,n,key) == True):
    print("The element exists in the list")
else:
    print("The element does not exist in the list")
