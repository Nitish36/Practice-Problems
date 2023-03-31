import math
def sum_of_squares(num):
    sum = 0
    for i in range(1,num+1):
        sum=sum+math.pow(i,2)
    
    return sum

print("Enter a number")
number = int(input())
print("Sum of first {} natural numbers is {}".format(number,sum_of_squares(number)))
