def duplicates(string):
    mydict = {}
    for char in string:
        if char not in mydict:
            mydict[char] = 1
        
        else:
            mydict[char] +=1
    
    duplicate = []
    for char,count in mydict.items():
        if count>1:
            duplicate.append(char)
    
    return duplicate

print(duplicates("SOOOME string"))
