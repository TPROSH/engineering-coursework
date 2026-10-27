#include<stdio.h>
#include<stdlib.h>

void main(){
    FILE *f1;
    f1 = fopen("ques1.txt", "r");
    int num;
    printf("---Stored data---");
    fscanf(f1,"%d",&num);
    fprintf(stdout, "%d", num);
    fclose(f1);
}