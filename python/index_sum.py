def fun(arr,sum):
    ctr = 0
    i = 0
    j = i+1
    for i in arr:
        for j in arr:
            if i+j == sum and i<j:
                ctr = ctr+1
    return ctr
arr = [1,5,7,-1,5]
sum = 6
print(fun(arr,sum))
