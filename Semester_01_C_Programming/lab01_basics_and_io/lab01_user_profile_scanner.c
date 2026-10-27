//to read and display fname , sname , yob
#include <stdio.h>

int main()
{
    char fname[20],sname[20];
    int yob;
    
    printf("Enter your first name :- ");
    scanf("%s",&fname);
    
    printf("Enter your last name :- ");
    scanf("%s",&sname);
    
    printf("Enter your year of birth :- ");
    scanf("%d",&yob);
    
    printf("%s %s %d", fname,sname,yob);
    return 0;
}