//to convert temp c to f
#include <stdio.h>

int main()
{
    float centi,farhen;
    
    printf("Enter temperature in celsius:- ");
    scanf("%f" ,&centi);
    
    farhen = (9*centi)/5 + 32;
    printf("Temperature in farhenheit :- %f",farhen);
    return 0;
}