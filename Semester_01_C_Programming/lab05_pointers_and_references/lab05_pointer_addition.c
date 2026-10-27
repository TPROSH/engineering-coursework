#include <stdio.h>

int main()
{
    int a,b;
    int *p = &a;
    int *q = &b;

    printf("Enter a number :- ");
    scanf("%d",&a);

    printf("Enter a number :- ");
    scanf("%d",&b);

    printf("sum of numbers :- %d", (*p + *q));
}
