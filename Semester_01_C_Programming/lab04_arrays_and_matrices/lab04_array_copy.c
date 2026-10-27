#include <stdio.h>

int main(){
    int a[5];
    int b[5];
    for(int i=0 ; i<5 ; i++){
        printf("Enter a number to store in array 1 = ");
        scanf("%d" , &a[i]);
    }

    printf("\nValue stored in array 1 = ");
    for(int j=0 ; j<5 ; j++){
        printf("%d " , a[j]);
    }

    printf("\nValue stored in array 2 = ");
    for(int k=0 ; k<5 ; k++){
        b[k] = a[k];
        printf("%d " , b[k]);
    }
    
return 0;
}
