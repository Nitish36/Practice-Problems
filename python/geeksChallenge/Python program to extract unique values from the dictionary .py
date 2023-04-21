myDict = {
    "IDA":[1,2,2,3,4,4,1],
    "IDB":[10,10,20,34,20],
    "IDC":[20,10,33,20,50]
}

l = []

l = list(set(sum(myDict.values(),[])))
print(l)
