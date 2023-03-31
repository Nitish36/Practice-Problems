import math
def sum_of_cubes(num):
    sum = 0
    for i in range(1,num+1):
        sum=sum+math.pow(i,3)
    
    return sum

print("Enter a number")
number = int(input())
print("Sum of first {} natural numbers is {}".format(number,sum_of_cubes(number)))
