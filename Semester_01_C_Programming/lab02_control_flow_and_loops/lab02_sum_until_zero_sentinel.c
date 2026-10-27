//to add n no. of numbers entered by user and stop at entering 0
#include <stdio.h>

int main()
{

    int a = 5;
    int sum = 0;

    while( a !=0 ){
        printf("Enter number to add :- ");
        scanf("%d" , &a);
        sum = sum + a;
    }
    printf("total sum of all numbers entered :- %d" , sum);

    return 0;
}