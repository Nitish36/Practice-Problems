import math
def area(r):
    area = math.pi*math.pow(r,2)
    return area

print("Enter the radius value")
radius = int(input())
print("The area of a circle with radius {} is {}".format(radius,area(radius)))
