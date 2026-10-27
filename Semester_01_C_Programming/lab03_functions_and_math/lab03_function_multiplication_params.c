#include <stdio.h>

int mul(int c , int d){
    int s = c * d ;
    printf("multiplication of a and b = %d " , s);
    return s;
}


void main(){

    int a ,b;

    printf("Enter the value of a :- ");
    scanf("%d" , &a);

    printf("Enter the value of b :- ");
    scanf("%d" , &b); 

    mul(a,b);
}


