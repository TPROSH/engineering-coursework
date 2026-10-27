#include <stdio.h>
#include <string.h>

void main()
{
    char a[100];

    printf("Enter a string :- ");
    fgets(a , sizeof(a), stdin);     //c, size of c , stdin , it terminates input with null terminator
    printf("entered string is %s", a);

    int len = strlen(a);
    printf("lenght of string is %d",(len-1));
}
