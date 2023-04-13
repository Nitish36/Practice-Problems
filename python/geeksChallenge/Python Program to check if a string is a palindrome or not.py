def solution(inputString):
    revStr = inputString[::-1]
    
    if(list(inputString) == list(revStr)):
        return True
    
    return False 
print("Enter a string")
str = input()
if solution(str) == True:
    print("{} is a palindrome".format(str))
else:
    print("{} is not a palindrome".format(str))
