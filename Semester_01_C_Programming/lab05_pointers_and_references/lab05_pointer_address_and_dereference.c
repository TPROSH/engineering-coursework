#include <stdio.h>
void main()
{
   int a = 1;
   float b = 1.000;
   double c = 1.000;
   char d = 'A';
   
   int *p = &a;
   float *q = &b;
   double *r = &c;
   char *s = &d;
   
   printf("Address of a is %p\n",p);
   printf("Address of b is %p\n",q);
   printf("Address of c is %p\n",r);
   printf("Address of d is %p\n",s);

   printf("Value of a is %d\n",*p);
   printf("Value of b is %f\n",*q);
   printf("Value of c is %lf\n",*r);
   printf("Value of d is %c\n",*s);
}