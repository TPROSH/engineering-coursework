//to print entered int , float, double value
#include <stdio.h>

int main()
{
    int a;
    float b;
    double c;
    
    printf("Enter an integer value :- ");
    scanf("%d",&a);
    
    printf("Enter a float value :- ");
    scanf("%f",&b);
    
    printf("Enter a double value :- ");
    scanf("%lf",&c);
    
    printf("%d %f %lf",a,b,c);
    return 0;
}