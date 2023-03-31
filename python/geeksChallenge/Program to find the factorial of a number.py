def fact(num):
    prod = 1
    if num<0:
        print("Enter a valid number")
    
    elif num == 0:
        return 1
    
    else:
        for i in range(1,num+1):
            prod = prod*i
        
    return prod   

print("Enter a valid number")
n = int(input())
print("The factorial of {} is {}".format(n,fact(n)))
