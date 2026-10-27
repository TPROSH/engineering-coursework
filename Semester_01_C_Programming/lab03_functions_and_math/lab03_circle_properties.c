#include <stdio.h>
#include <math.h>
#define m1 3.14

int diameter(int R)
{
    int d = R*2;
    printf("Diameter of circle = %d \n" , d);
}
int circumference(int R){
    float c = 2*R* m1;
    printf("circumference of circle = %f \n" , c);
}
int area(int R){
    float a = R*R*m1;
    printf("area of circle = %f" , a);
}    

void main()
{
    int r;
    printf("Enter the value of radius r :- ");
    scanf("%d" , &r);

    diameter(r);
    circumference(r);
    area(r);
}

