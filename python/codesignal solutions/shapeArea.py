def solution(n):
    k=0
    s=1
    for i in range(n-1):
        k+=2
    for i in range(k):
        s+=n
    return(s)
