#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_T 100

int sum[MAX_T];

void* f(void *a){

	int tnum = *(int*)a;
	int suma=0;
	for (int i=1;i<=1000;i++)
	{
		suma+=(rand() % 3);
	}

	sum[tnum]=suma;

	return NULL;

}

int main()
{
	pthread_t t[MAX_T];

	for(int i=0;i<MAX_T;i++)
	{
		pthread_create(&t[i],NULL,f,&i);
	}


	for(int i=0;i<MAX_T;i++)
        {
                pthread_join(t[i],NULL);
        }

	int suma=0;

	for(int i=0;i<MAX_T;i++)
        {
                suma+=sum[i];
        }

	printf("%d",suma);


	return 0;
}

