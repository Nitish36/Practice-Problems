def odd_list(start,end,l):
    ev_li = []
    for i in range(start,end-1):
        if l[i] % 2 != 0:
            ev_li.append(l[i])
    
    print(ev_li)

print("Enter the starting of the list")
start = int(input())
print("Enter the end of the list")
end = int(input())
li = []
print("Enter the elements")
for i in range(start,end):
    num = int(input())
    li.append(num)

odd_list(start,end,li)
