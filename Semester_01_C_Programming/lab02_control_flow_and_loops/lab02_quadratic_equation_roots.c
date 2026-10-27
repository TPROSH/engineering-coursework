//to solve quadratic equations 
#include <stdio.h>
#include <math.h>
int main()
{

    double a ,b ,c ;

    printf("ax^2 + bx + c = 0 \n");

    printf("Enter cofficient of x^2 :- ");
    scanf("%lf" , &a);

    printf("Enter coffiecient of x :- ");  
    scanf("%lf" , &b);

    printf("Enter value of c :- ");  
    scanf("%lf" , &c);

    double d = (b*b) - (4*a*c);
    double e = pow(d , 0.5);

    if(d>=0){
        printf("\nfirst root = %lf" , (-b+e)/(2*a));
        printf("\nsecond root = %lf " , (-b-e)/(2*a));
    }

    else{
        printf("roots are unreal");
    }

    return 0;
}