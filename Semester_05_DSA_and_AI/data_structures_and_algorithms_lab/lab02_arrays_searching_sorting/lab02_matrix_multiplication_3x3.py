#Write a program for matrix multiplication of size 3x3.

mat_A = [[1,2,3],[4,5,6],[7,8,9]]
mat_B = [[10,20,30],[40,50,60],[70,80,90]]
mat_C = [[0,0,0],[0,0,0],[0,0,0]]

for i in range(3):
    for j in range(3):
        for k in range(3):
            mat_C[i][j] += mat_A[i][k] * mat_B[k][j]  
print(mat_C)