#Enter Python code here and hit the Run button.

list1 = [10, 20, 30, 40]
list2 = [100, 200, 300, 400]
i = 0
j = len(list2)-1
while(i<len(list1) and j>=0):
    print(list1[i],"",list2[j])
    i=i+1
    j=j-1
