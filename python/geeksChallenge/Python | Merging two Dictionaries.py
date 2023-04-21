myDict1 = {}
myDict2 = {}

print("Enter the number of items to be added to the dictionary 1")
m = int(input())
print("Enter the number of items to be added to the dictionary 2")
n = int(input())

print("Enter the items for dictionary1")
for i in range(m):
    print("Enter the key value")
    key = input()
    print("Enter the value")
    value = input()
    
    myDict1[key] = value

for i in range(n):
    print("Enter the key value")
    key = input()
    print("Enter the value")
    value = input()
    
    myDict2[key] = value

print("Generated Dictionary 1")
print(myDict1)

print("Generated Dictionary 2")
print(myDict2)

myDict3 = myDict1.copy()
myDict3.update(myDict2)

print(myDict3)
