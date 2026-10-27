//reverse of a string
#include <stdio.h>
#include <string.h>

void main()
{
    char a[20];
    printf("Enter a string :- ");
    scanf("%s",&a);
    int c=strlen(a);
    
    printf("Entered String :- ");
    for(int i=0;i<c;i++)
    {
        printf("%c ",a[i]);
    }
    
    printf("\nReverse String :- ");
    for(int i=0;i<c;i++)
    {
        printf("%c ",a[c-i-1]);
    }
    
    printf("\nReverse String :- ");
    for(c;c>0;c--)
    {
        printf("%c ",a[c-1]);
    }
}