def sum_of_dictionary(myDict):
    sum = 0
    for i in myDict.values():
        sum = sum + i
    
    return sum

myDict = {}
print("Enter the length of the dictionary")
n = int(input())
print("Enter the key value pair for the dictionary")
for i in range(n):
    print("Enter the key ")
    key = int(input())
    print("Enter the value")
    value = int(input())
    myDict[key] = value

print("Generated Dictionary is ")
print(myDict)
print("The sum of values of the dictionary are ",sum_of_dictionary(myDict))
