#include <stdio.h>

int main(){
    int a[5];
    for(int i=0 ; i<5 ; i++){
        printf("Enter a number to store in array = ");
        scanf("%d" , &a[i]);
    }
    array(a);
    return 0;
}
int array(int b[5])
{
    int count = 0;
    for(int i=0 ; i<5 ; i++){
        count += b[i];
    }

    printf("sum of numbers entered in array :- %d",count);
    return 0;
}