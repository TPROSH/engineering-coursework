//to print perimeter of rectangle 
#include <stdio.h>

int main()
{
    int h , w;
    
    printf("Enter height of rectangle :- ");
    scanf("%d" ,&h);
    
    printf("Enter width of rectangle :- ");
    scanf("%d" ,&w);
    
    printf("Perimeter of rectangle :- %d",2*(h+w));
    return 0;
}