//To check two numbers are equal or not
#include <stdio.h>

int main()
{

    int a ,b ;

    printf("Enter first number :- ");
    scanf("%d" , &a);

    printf("Enter second number :- ");  
    scanf("%d" , &b);

    if(a==b){
        printf("NuMbers are equal");
    }

    else{
        printf("number are not equal");
    }

    return 0;
}