print("Enter the length of the list")
n = int(input())
l = []

print("Enter the {} elements".format(n))
for i in range(n):
    num = int(input())
    l.append(num)

print(l)

largest = l[0]
second_largest = l[1]

for i in range(2,n,1):
    if l[i] > largest:
        second_largest = largest
        largest = l[i]

print("Second largest element in the list is ",second_largest)
