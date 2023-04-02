def fibon_check(num):
    a = 0
    b = 1
    c = 0
    l_of_fibon = []
    print("Enter the number of terms in the series")
    n = int(input())
    print("{},{}".format(a,b))
    for i in range(2,n,1):
        c = a+b
        l_of_fibon.append(c)
        print("{},".format(c))
        a = b
        b = c

    for i in range(len(l_of_fibon)):
        if num == l_of_fibon[i]:
            return True

    return False

print("Enter the number to be checked in the fibonacci series")
num = int(input())

if fibon_check(num) == True:
    print("The number {} is present in the fibonacci series ".format(num))

else:
    print("The number {} is not present in the fibonacci series ".format(num))
        
