sq = lambda x:x*2

l = [10,20,30,40,50,60,70]

new_list = list(map(sq,l))

print("Using map function")
print(new_list)

def filtering(x):
    if x%6 == 0:
        return True
    
    else:
        return False

new_list1 = list(filter(filtering,new_list))

for x in new_list1:
    print(x)
