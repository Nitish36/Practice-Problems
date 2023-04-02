a = 0
b = 1
c = 0
print("Enter the number of terms")
n = int(input())
print("{},{}".format(a,b))
for i in range(2,n,1):
    c = a+b
    print("{},".format(c))
    a = b
    b = c
