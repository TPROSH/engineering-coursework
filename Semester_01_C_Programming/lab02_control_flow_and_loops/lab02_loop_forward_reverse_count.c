//to print 0 to 10 and 10 to 0
#include <stdio.h>

int main()
{

    int a = 0 ;
    int b = 10;
    
    while( a < 11 ){
        printf("%d " , a);
        a = a + 1 ;
    }

    printf("\n");

    while( b >=  0 ){
        printf("%d " , b);
        b = b - 1 ;
    }

    /*printf("\n");
    for(a=0; a<11 ; a=a+1){
        printf("%d " , a);
    }
    
    printf("\n");
   for(b = 10; b>=0; b--)
   {
        printf("%d " , b);
   }*/

    return 0;

}