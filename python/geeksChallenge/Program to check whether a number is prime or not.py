def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5)+1):
        if num % i == 0:
            print("Composite Number")
            
        else:
            print("Prime number")

print("Enter a number")
num = int(input())
is_prime(num)
