#include <stdio.h>

int main()
{
    int a,b;
    
    printf("Enter a number :- ");
    scanf("%d",&a);

    printf("Enter a number :- ");
    scanf("%d",&b);

    pointer(a,b);
    return 0;
}

int pointer(int c , int d)
{
    int *p = &c;
    int *q = &d;

    int *r = p;
    int *s = q;

    printf("%d %d\n%d %d ",*p,*q, *s , *r);
}
