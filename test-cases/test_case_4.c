#include <stdio.h>
void temp()
{
	int i,sum=0;
	for(i=0;i<10;i++)
		sum+=i;
}
int main(int argc, char const *argv[])
{
	int a[10][10],i,j,sum=0;
	for(i=0;i<10;i++)
	{
		for(j=0;j<10;j++)
		{
			a[i][j]=i+j;
		}
	}
	for(i=0;i<10;i++)
	{
		sum=0;
		for(j=0;j<10;j++)
		{
			sum+=a[i][j];
		}
	}
	for(i=0;i<10;i++)
		a[i][0]=2*i;
	printf("%d\n",sum);
	return 0;
}