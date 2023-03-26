#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/stat.h> 
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>

#define MAX_T 100

int catediv[MAX_T];
int nums[100000];

void* f(void* a){

	int tnum= *(int*) a;
	int n=tnum*1000;
	int div=0;
	for(int i=n;i<n+1000;i++)
	{
		if(nums[i]%5==0)
			div++;
	}

	catediv[tnum]=div;

	return NULL;
}

int main(){

	int fd=open("random-file.bin", O_RDONLY);
	for(int i=0;i<100000;i++)
		read(fd,&nums[i],2);

	pthread_t t[MAX_T];

	for(int i=0 ;i<MAX_T;i++){
		int *n = (int *)malloc(sizeof(int));
		*n = i;
		pthread_create(&t[i],NULL,f,n);
	}

       for(int i=0 ;i<MAX_T;i++){

                pthread_join(t[i],NULL);
        }

	int div=0;

        for(int i=0 ;i<MAX_T;i++){

                div+=catediv[i];
        }

	printf("%d\n",div);

	return 0;
}
