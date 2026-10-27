//to print week name according to week number 1 to 7
#include <stdio.h>

int main(){
    int a;

    printf("Enter a number between 1 to 7 :- ");
    scanf("%d" , &a);
    
    switch(a){
        case 1:
            printf("Day of week is Monday.");
            break;
        case 2:
            printf("Day of week is Tuesday.");
            break;
        case 3:
            printf("Day of week is Wednesday.");
            break;
        case 4:
            printf("Day of week is Thursday.");
            break;
        case 5:
            printf("Day of week is Friday.");
            break;
        case 6:
            printf("Day of week is Saturday.");
            break;
        case 7:
            printf("Day of week is Sunday.");
            break;
        default:
            printf("number is not between 1 to 7");
            break;
    }
    return 0;
}