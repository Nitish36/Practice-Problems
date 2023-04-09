def negative(start,end):
    neg_li = []
    for i in range(start,end):
            neg_li.append(i)
    
    print(neg_li)

print("enter the start index  of the list")
start = int(input())
print("enter the end index  of the list")
end = int(input())
negative(start,end)