print("Enter a string")
s = input()
print("Enter the start index and end index of the string to be sliced")
m = int(input())
n = int(input())
if m>len(s) and n>len(s):
    print("Enter a valid length")
sliced_str = s[m:n]
rotated_string = s[n:] + sliced_str
print(rotated_string)
