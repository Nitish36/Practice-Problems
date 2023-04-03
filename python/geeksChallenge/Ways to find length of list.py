#1 Use a counter variable to calculate the length

import count


li = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160]
ctr = 0
for i in (range(len(li))):
    ctr = ctr+1

print("The length of the list is ",ctr)

#2 Use len function 

x = len(li)
print("The length of the list using len function ",x)
