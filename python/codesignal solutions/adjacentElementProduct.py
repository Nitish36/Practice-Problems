def solution(inputArray):
    prod = inputArray[0]*inputArray[1]
    finalprod = prod
    l = []
    x = len(inputArray)-1
    for i in range(x):
        if inputArray[i]*inputArray[i+1]>prod:
            finalprod = inputArray[i]*inputArray[i+1]
            l.append(finalprod)
        else:
            l.append(prod)
    return max(l)
