#include <stdio.h>

int main(){
    int a[5];
    for(int i=0 ; i<5 ; i++){
        printf("Enter a number to store in array = ");
        scanf("%d" , &a[i]);
    }

    printf("Value stored in array = ");
    for(int j=0 ; j<5 ; j++){
        printf("%d " , a[j]);
    }
return 0;
}


/*
int a[5];
int main(int b){
    printf("Enter a number to store in array = ");
    scanf("%d" , &b);
    array(b);
}

int array(){
    for(int i=0 ; i<5 ; i++){
        printf("Enter a number to store in array = ");
        scanf("%d" , &a[i]);
    }

    printf("Value stored in array = ");
    for(int j=0 ; j<5 ; j++){
        printf("%d " , a[j]);
    }
}*/