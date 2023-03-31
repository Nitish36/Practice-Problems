import math

def isArmstrong(num):
    n = num
    sum=0
    while(num>0):
        rem = num%10
        sum = sum+int(rem*rem*rem)
        num = num//10
    
    if n == sum:
        print(n," is an armstrong number")
    else:
        print(n," is not an armstrong number")

print("Enter a number")
number = int(input())
isArmstrong(number)

