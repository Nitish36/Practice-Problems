def solution(statues):
    sorted_statues = statues.sort()
    
    count_additional = 0
    
    for i in range(len(statues)):
        diff = statues[i] - statues[i-1]
        if(diff>1):
            count_additional = count_additional+(diff)-1
    
    return count_additional
