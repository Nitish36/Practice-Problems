def snake_to_pascal(s,delimiter):
    words = s.split(delimiter)
    joined_str = ''.join(word.capitalize() for word in words)
    return joined_str

print("Enter a string in snake form")
s = input()
print("Enter the delimiter associated with it")
delimiter = input()
print("Pascal string is ")
print(snake_to_pascal(s,delimiter))
