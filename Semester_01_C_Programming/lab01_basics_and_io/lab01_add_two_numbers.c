//to add two numbers from user
#include <stdio.h>

int main()
{
    int a, b ,sum;
    
    printf("Enter a number :- ");
    scanf("%d" ,&a);
    
    printf("Enter a number :- ");
    scanf("%d",&b);
    
    sum = a+b;
    printf("Sum of numbers :- %d", sum);
    return 0;
}