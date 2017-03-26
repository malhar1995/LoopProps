#include <bits/stdc++.h>
using namespace std;
bool isprime[4000];
vector<int> primes;
void sieve()
{
	for(int i=2;i<=sqrt(3000);i++)
	{
		if(isprime[i])
		{
			for(int j=i*i;j<=3000;j+=i)
			{
				isprime[j]=false;
			}
		}
	}
}
int main(int argc, char const *argv[])
{
	int ans=0;
	for(int i=0;i<=3000;i++)
		isprime[i]=true;
	sieve();
	for(int i=2;i<=3000;i++)
	{
		if(isprime[i])
			primes.push_back(i);
	}
	int n;
	scanf("%d",&n);
	for(int i=1;i<=n;i++)
	{
		int counter=0;
		for(int j=0;j<primes.size();j++)
		{
			if((i%primes[j])==0)
				counter++;
		}
		if(counter==2)
			ans++;
	}
	printf("%d\n",ans);
	return 0;
}