#Decimal to binary
'''
print("Enter a decimal number")
dec_num = int(input())
l = []
while dec_num>0:
    rem = dec_num%2
    l.append(rem)
    dec_num = dec_num//2

l.reverse()
s = ''.join(map(str,l))
print("The binary format is:")
print(s)
'''

#Binary to decimal
print("Enter a binary number")
binary = int(input())
dec = 0
i = 0
rem = 0

while binary!=0:
    rem = binary%10
    dec = dec+rem*pow(2,i)
    binary = binary//10
    i+=1

str_dec = str(dec)
print("The Decimal Format is")
print(str_dec)