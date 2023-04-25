def max_freq(s):
    dictionary = {}
    ctr = 1
    for char in s:
        if char not in dictionary:
            dictionary[char] = ctr
        else:
            dictionary[char] +=ctr
    
    print(dictionary)
    max_char = max(dictionary,key = dictionary.get)
    print(max_char," maximum frequency ",max(dictionary.values()))
    

print("Enter a string")
s = input()
max_freq(s)
