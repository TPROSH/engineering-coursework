#include<stdio.h>
#include<stdlib.h>

void main(){
    FILE *f1;
    int n;
    f1 = fopen("Library", "w");
    printf("enter number of book: ");
    scanf("%d", &n);

    //reading input
    printf("---Enter Data---\n");
    char title[50];
    int price;
    for (int i = 0; i < n; i++){
        fscanf(stdin, "%s  %d", title, &price);
        fprintf(f1,"%s %d\n", title, price);
    }
    fclose(f1);

    f1 = fopen("Library", "r");
    printf("\n [Name] - [Price]\n");
    for (int i =0 ; i < n; i ++){
        fscanf(f1, "%s %d", title, &price);
        fprintf(stdout, "%s - %d", title, price);
        printf("\n");
    }
    fclose(f1);
}