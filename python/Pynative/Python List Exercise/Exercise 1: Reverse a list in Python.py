#Enter Python code here and hit the Run button.

list1 = [100,200,300,400,500]
list2 = []
for i in range(len(list1)-1,-1,-1):
    list2.append(list1[i])
print(list2)
