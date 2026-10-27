#include <stdio.h>

int main()
{
    float a,b;
    float *p = &a;
    float *q = &b;

    printf("Enter a number :- ");
    scanf("%f",&a);

    printf("Enter a number :- ");
    scanf("%f",&b);

    printf("\nsum of numbers :- %f\n", (*p + *q));
    printf("subtraction of numbers :- %f\n", (*p - *q));
    printf("multiplication of numbers :- %f\n", (*p * *q));
    printf("division of numbers :- %f", (*p / *q));
}
