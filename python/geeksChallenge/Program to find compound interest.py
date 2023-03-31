import math
def comp_intrest(P,r,t):
    A = P*math.pow(1+r,t)
    
    return A

print("Enter a principal amount")
principal = float(input())

print("Enter a rate")
rate = float(input())

print("Enter a time in years")
time = float(input())

c_interest = comp_intrest(principal,time,rate)
print("The simple interest for principal {}, time {} ,rate {} is {}".format(principal,time,rate,c_interest))
