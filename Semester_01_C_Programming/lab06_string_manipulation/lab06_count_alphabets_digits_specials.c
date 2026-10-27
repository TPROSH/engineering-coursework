//reverse of a string
#include <stdio.h>
#include <string.h>

void main()
{
    char a[100];
    printf("Enter a string: ");
    scanf("%s", a); // No need for &a, as a is already a pointer.
    
    int alp = 0, dig = 0, spc = 0;
    int c = strlen(a);
    int i = 0;
    
    while (a[i] != '\0')
    {
        if ((a[i] >= 'a' && a[i] <= 'z') || (a[i] >= 'A' && a[i] <= 'Z'))
        {
            alp += 1;
        }
        else if (a[i] >= '0' && a[i] <= '9')
        {
            dig += 1;
        }
        else
        {
            spc += 1;
        }
        i++;
    }
    
    printf("Alphabets: %d, Digits: %d, Special Characters: %d\n", alp, dig, spc);
}