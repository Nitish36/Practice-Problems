print("Enter a string")
s = input()
new_str = ""
print("Enter a substring associated with the string")
substr= input()
if substr in s:
    new_str = s.replace(substr, "*")

print(new_str)
