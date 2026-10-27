#include<stdio.h>
#include<stdlib.h>

void main(){
    FILE *f1;
    f1 = fopen("ques1.txt", "w");
    int x;

    printf("enter x = ");
    scanf("%d", &x);
    putw(x,f1);

    fclose(f1);
    f1 = fopen("ques1.txt", "r");
    int c = getw(f1);
    printf("stored integer = %d", c);
    fclose(f1);
}