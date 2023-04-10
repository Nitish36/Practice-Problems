matrix = [[10, 6, 20, 48],  
          [37, 47, 12, 57],  
          [78, 37, 71, 52]]  
  
result_matrix = [[0, 0, 0],  
          [0, 0, 0],  
          [0, 0, 0],  
          [0, 0, 0]]  
  
# iterating through the rows  
for i in range(len(matrix)):  
   # iterating through the columns  
   for j in range(len(matrix[0])):  
        result_matrix[j][i] = matrix[i][j]  
  
for i in result_matrix:  
    print(i)  
