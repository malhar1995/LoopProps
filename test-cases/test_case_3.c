#include <stdio.h>
int main(int argc, char const *argv[])
{
	int i,a[10][10],j;
	for(i=0;i<10;i++)
	{
		for(j=0;j<10;j++)
		{
			a[i][j]=i+j;
		}
	}
	return 0;
}