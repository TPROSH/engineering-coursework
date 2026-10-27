#include <stdio.h>
#include <stdlib.h>

int main(){
    int a[5];
    for(int i=0 ; i<5 ; i++){
        printf("Enter a number to store in array = ");
        scanf("%d" , &a[i]);
    }

    printf("negative values stored in array = ");
    for(int j=0 ; j<5 ; j++){
        if(a[j] < 0){
            printf("%d ", a[j]);
        }
        else{
            continue;
        }
    }
}