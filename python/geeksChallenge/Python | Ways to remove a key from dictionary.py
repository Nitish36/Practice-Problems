def delete_pop(myDict,item):
    myDict.pop(item)
    
    return myDict

def delete_popitem(myDict):
    myDict.popitem()
    
    return myDict
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
print("Enter the item of deletion")
item = int(input())
print("The values of the dictionary after pop ",delete_pop(myDict,item))

print("The Values of dictionary after popitem",delete_popitem(myDict))
