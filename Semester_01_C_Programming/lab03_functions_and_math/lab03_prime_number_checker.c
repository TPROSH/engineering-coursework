
#include <stdio.h>
#include<stdlib.h>

void prime(int N);
void main() 
{
	int n;
	printf("enter a number:- ");
	scanf("%d",&n);
	prime(n);
}

void  prime(int N)
{
	if(N<2)
	{
		printf("not prime");
	}
	else
	{
	    
		for(int i =2; i<N; i++)
		{
			if(N%i == 0)
			{
				printf("Not prime");
				exit(0);
			}
		}
		printf("prime");	
	}
}

