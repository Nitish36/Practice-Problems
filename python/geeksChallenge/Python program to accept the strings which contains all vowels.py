vowels = set('aeiou')
print("Enter a string")
s = input()
if vowels.issubset(s):
    print("Contains vowels")
else:
    print("Does not contain")
