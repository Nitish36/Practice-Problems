def isSubstr(s,substr):
    if substr in s:
        return True
    else:
        return False

print("Enter a string")
s = input()
print("Enter a substring")
substr = input()
if isSubstr(s,substr) == True:
    print("Substring found...")
else:
    print("Substring not found")
