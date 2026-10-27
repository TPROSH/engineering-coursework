//to calculate total number of minutes 
#include <stdio.h>

int main()
{
    int h ,m;
    
    printf("Enter hours :- ");
    scanf("%d" ,&h);
    
    printf("Enter minutes :- ");
    scanf("%d" ,&m);
    
    printf("Total minutes :- %d",(h*60)+m);
    return 0;
}