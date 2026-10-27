#include<stdio.h>

struct Student
{
    char name[50];
    int age;
    int tm;
} S1,S2;

void main(){

    printf("----Data of Student1----");
    printf("enter name: ");
    scanf("%s", S1.name);
    printf("enter age: ");
    scanf("%d", &S1.age);
    printf("enter marks: ");
    scanf("%d", &S1.tm);

    printf("----Data of Student2----");
    printf("enter name: ");
    scanf("%s", S2.name);
    printf("enter age: ");
    scanf("%d", &S2.age);
    printf("enter marks: ");
    scanf("%d", &S2.tm);

    printf("[name] - [age] - [total marks]\n");
    printf("%s - %d - %d", S1.name, S1.age, S1.tm);
    printf("\n%s - %d - %d", S2.name, S2.age, S2.tm);

    printf("average value: %d", (S1.tm + S2.tm)/2);

}
