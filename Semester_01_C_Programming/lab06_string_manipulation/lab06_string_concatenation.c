//To connect two strings 
#include <stdio.h>
#include <string.h>

void main()
{
    char a[20],b[20];
    
    printf("Enter a string :- ");
    scanf("%s",&a);

    printf("Enter a string :- ");
    scanf("%s",&b);
    
    strcat(a,b);
    printf("Connected String :- %s" ,a);
}
    