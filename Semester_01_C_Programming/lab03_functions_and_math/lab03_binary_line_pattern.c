#include <stdio.h>
void line(int a);

void main()
{
    int l;
    printf("enter number of lines :- ");
    scanf("%d" , &l);
    line(l);
}

void line(int a){
    int L;
    if(a%2==0){
        L=a/2;
    }
    else{
        L=(a+1)/2;
    }

    for(int k = 0 ; k<L ; k++){
        printf("\n");
        for(int i = 0 ; i<a ; i++){
            printf("1 ");
        }
        printf("\n");
        for(int j = 0 ; j<a ; j++){
            printf("0 ");
        }
    }

    return 0;
}