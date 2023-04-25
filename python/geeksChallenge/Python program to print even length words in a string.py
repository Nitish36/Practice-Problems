def split_word(words):
    l_even = []
    for i in words:
        if len(i) % 2 == 0:
            l_even.append(i)
    
    s_even = ' '.join(word for word in l_even)
    print(s_even)

print("Enter a string")
s = input()
print("Enter a delimiter")
delimiter = input()
words = s.split(delimiter)
print(words)

split_word(words)
