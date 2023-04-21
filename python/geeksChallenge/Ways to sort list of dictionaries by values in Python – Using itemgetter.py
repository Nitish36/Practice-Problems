from operator import itemgetter
def sort_dictionary(myList,key):
    sorted_list = sorted(myList,key=itemgetter(key))
    
    print("Sorted Disctionary is ")
    print(sorted_list)

myList = [
    {"id":10,"age":30},
    {"id":20,"age":10},
    {"id":30,"age":70}
]

print("Generated Dictionary is ")
print(myList)
print("Enter the key based on which sorting should happen")
key = (input())

sort_dictionary(myList,key)
