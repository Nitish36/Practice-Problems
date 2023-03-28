def solution(ride_time, ride_distance, cost_per_minute, cost_per_mile):
    l = []
    price = 0
    for i in range(len(cost_per_minute)):
        price = cost_per_minute[i]*ride_time+cost_per_mile[i]*ride_distance
        l.append(price)
    
    return l
