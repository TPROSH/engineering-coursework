//to check entered number is -ve or +ve
#include <stdio.h>

int main()
{

    int a ;

    printf("Enter first number :- ");
    scanf("%d" , &a);

    if(a>=0){
        printf("number is positive");
    }
    else{
        printf("number is negative");
    }

    return 0;
}