#include<stdio.h>

struct Book
{
    char title[50];
    int price;
    char auth[50];
} B1,B2,B3;

void main(){
    printf("----Data of Book1---- \n");
    printf("enter Title: ");
    scanf("%s", B1.title);
    printf("enter Author: ");
    scanf("%s", B1.auth);
    printf("enter Price: ");
    scanf("%d", &B1.price);

    printf("----Data of Book1---- \n");
    printf("enter Title: ");
    scanf("%s", B2.title);
    printf("enter Author: ");
    scanf("%s", B2.auth);
    printf("enter Price: ");
    scanf("%d", &B2.price);

    printf("----Data of Book1---- \n");
    printf("enter Title: ");
    scanf("%s", B3.title);
    printf("enter Author: ");
    scanf("%s", B3.auth);
    printf("enter Price: ");
    scanf("%d", &B3.price);

    if (B1.price > B2.price && B1.price > B3.price){
        printf("Max price : %d", B1.price);
    }
    else if (B2.price > B1.price && B2.price > B3.price){
        printf("Max price : %d", B2.price);
    }
    else{
        printf("Max price : %d", B3.price);
    }
}
