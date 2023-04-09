def positive(start,end):
    pos_li = []
    for i in range(start,end):
            pos_li.append(i)
    
    print(pos_li)

print("enter the start index  of the list")
start = int(input())
print("enter the end index  of the list")
end = int(input())
positive(start,end)