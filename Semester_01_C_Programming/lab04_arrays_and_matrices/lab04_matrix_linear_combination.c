#include <stdio.h>

int array(int m , int n);
int main()
{
    int m,n;
    
    printf("enter the number of rows :- ");
    scanf("%d" , &m);
    printf("enter the number of columns :- ");
    scanf("%d" , &n);
    array(m , n);
    return 0;
}

int array(int m , int n)
{
    int e[m][n];
    int a[m][n];
    int b[m][n];
    
    for(int i=0 ; i<m ; i++)
    {
        for(int j=0 ; j<n ; j++)
        {
            printf("Enter a number to store at row %d and column %d of array A = " , i , j);
            scanf("%d" , &a[i][j]);
        }   
    }
    printf("\n");

    for(int i=0 ; i<m ; i++)
    {
        for(int j=0 ; j<n ; j++)
        {
            printf("Enter a number to store at row %d and column %d of array B = " , i , j);
            scanf("%d" , &b[i][j]);
        }
    }
    
    for(int i=0 ; i<m ; i++)
    {
        printf("\n");
        for(int j=0 ; j<n ; j++)
        {
            e[i][j] = (2*a[i][j]) + (3*b[i][j]);
            printf("|_%d_|", e[i][j]);
        }
        
    }
}


