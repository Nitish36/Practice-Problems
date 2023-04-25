def symmetric(s):
    half = int(len(s)/2)
    str1 = s[half:]
    str2 = s[:half]
    
    if str1 == str2:
        return True 
    else:
        return False

def palin(s):
    s1 = ""
    n = len(s)-1
    for i in range(n,-1,-1):
        s1 = s1+s[i]
    
    if s == s1:
        return True
    else:
        return False

print("Enter a string")
s = input()
if symmetric(s) == True:
    print(s, "is symmetric")
else:
    print(s," is not symmetric")

if palin(s) == True:
    print(s," is a palindrome")
else:
    print(s, " is not a palindrome")
