//to perform all arithmetic operations 
#include <stdio.h>

int main()
{
    float a, b;
    
    printf("Enter a number :- ");
    scanf("%f" ,&a);
    
    printf("Enter a number :- ");
    scanf("%f",&b);
    
    printf("Sum of numbers :- %f\n", (a+b));
    printf("Difference of numbers :- %f\n", (a-b));
    printf("Multiplication of numbers :- %f\n", (a*b));
    printf("Division of numbers :- %f", (a/b));
    
    return 0;
}