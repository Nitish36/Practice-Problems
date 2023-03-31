def interest(p,t,r):
    si = (p*t*r)/100.0
    
    return si

print("Enter a principal amount")
principal = float(input())

print("Enter a rate")
rate = float(input())

print("Enter a time in years")
time = float(input())

s_interest = interest(principal,time,rate)
print("The simple interest for principal {}, time {} ,rate {} is {}".format(principal,time,rate,s_interest))
