def even_list(l,n):
    ev_li = []
    for i in range(n):
        if l[i] % 2 == 0:
            ev_li.append(l[i])
    
    print(ev_li)

print("Enter the length of the list")
n = int(input())
li = []
print("Enter the {} elements ".format(n))
for i in range(n):
    num = int(input())
    li.append(num)

even_list(li,n)
