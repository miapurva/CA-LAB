#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main (void)
{
        int no=10;
	int pre_bit[no];
	int actual_outcome[no];
	int update_bit[no];
	int i=0;
	int k=0;
	printf("Enter the first prediction bit\n'0' for not taken(NT)\n'1' for taken(T)\n");
	scanf("%d",&pre_bit[0]);
	srand(time(NULL));
	for(i=0;i<no;i++)
	{
		actual_outcome[i]=rand()%2;
                update_bit[i]=actual_outcome[i];
		if(i<no-1)                
		{
			pre_bit[i+1]=update_bit[i];
		}	
	}
        printf("Iteration\tPrediction Bit\tActual Outcome\tUpdate\n");
        for( k=0;k<no;k++)
	{
		printf("%d\t\t",k+1);
		if(pre_bit[k]==0)
			printf("T\t\t");
		else
            		printf("NT\t\t");
		if(actual_outcome[k]==0)
			printf("T\t\t");
		else
            		printf("NT\t\t");
		if(update_bit[k]==0)
			printf("T\n");
		else
            		printf("NT\n");

	}
	return(0);
}
