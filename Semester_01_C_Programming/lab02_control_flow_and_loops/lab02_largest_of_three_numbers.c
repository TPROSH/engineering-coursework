//to print largest number out of three
#include <stdio.h>

int main()
{

    int a ,b ,c ;

    printf("Enter first number :- ");
    scanf("%d" , &a);

    printf("Enter second number :- ");  
    scanf("%d" , &b);

    printf("Enter third number :- ");  
    scanf("%d" , &c);
    
    //if(a>b && a>c){printf("largest number is = %d" , a);}
    if(a>b){
        if(a>c){
            printf("the largest number is :- %d" , a);
        }
        else{
            printf("The largest number is :- %d" , c);
        }
    }

    else{
        if(b>c){
            printf("the largest number is :- %d" , b);
        }
        else{
            printf("The largest number is :- %d" , c);
        }
    }

    return 0;

}