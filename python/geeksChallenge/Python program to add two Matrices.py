import numpy as np
matrix1 = np.matrix('10,20,30;40,50,60;70,80,90')
matrix2 = np.matrix('11,12,13;14,15,16;17,18,19')
res_matrix = np.matrix('0,0,0;0,0,0;0,0,0')
for i in range(len(matrix1)):
    for j in range(len(matrix2[0])):
        res_matrix[i][j] = matrix1[i][j] + matrix2[i][j]

print("The resultant sum of matrix is ")
print(res_matrix)
