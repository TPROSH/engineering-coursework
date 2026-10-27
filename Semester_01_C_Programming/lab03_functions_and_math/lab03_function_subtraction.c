#include <stdio.h>

int a , b ;

int sub(){
    int s = a - b ;
    printf("subtraction of a and b = %d " , s);
    return s;
}


void main(){

    printf("Enter the value of a :- ");
    scanf("%d" , &a);

    printf("Enter the value of b :- ");
    scanf("%d" , &b); 

    sub();
}


