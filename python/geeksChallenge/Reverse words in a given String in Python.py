def reverse(s):
    s1 = ""
    n = len(s)-1
    for i in range(n,-1,-1):
        s1 = s1+s[i]
    
    print("Reversed Word")
    print(s1)

print("Enter a string")
s = input()
reverse(s)
