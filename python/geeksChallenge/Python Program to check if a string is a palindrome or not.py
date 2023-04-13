def solution(inputString):
    revStr = inputString[::-1]
    
    if(list(inputString) == list(revStr)):
        return True
    
    return False 
