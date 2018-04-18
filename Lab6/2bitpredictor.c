#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int no=10;
int iteration;
int state[10]; 
int pre_bit[10];
int actual_outcome[10];
int update_bit[10];
void state0();
void state1();
void state2();
void state3();	


void state0()//SNT
{
	
        if(iteration<no)
	{	
		state[iteration]=0;
        	actual_outcome[iteration]=rand()%2;
        	if(actual_outcome[iteration]==0)
		{
			update_bit[iteration]=pre_bit[iteration];
			iteration++;
                        pre_bit[iteration]=update_bit[iteration];
			state0();
		}
                else if(actual_outcome[iteration]==1)
		{
			update_bit[iteration]=pre_bit[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state1();
		}
		
	}
      	
}
void state1()//WNT
{
	if(iteration<no)
	{
		state[iteration]=1;
		actual_outcome[iteration]=rand()%2;
		if(actual_outcome[iteration]==0)
		{
			update_bit[iteration]=pre_bit[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state0();
		}
		else if(actual_outcome[iteration]==1)
		{
			update_bit[iteration]=actual_outcome[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state2();
		}
	}
        
}
void state2()          //WT
{

	if(iteration<no)
	{
		state[iteration]=2;
		actual_outcome[iteration]=rand()%2;
                if(actual_outcome[iteration]==0)
		{
			update_bit[iteration]=actual_outcome[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state1();
		}		
		else if(actual_outcome[iteration]==1)
                {
			update_bit[iteration]=actual_outcome[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state3();
		}
	}
	 
}

void state3()//ST
{
	if(iteration<no)
	{ 
		state[iteration]=3;
		actual_outcome[iteration]=rand()%2;
                if(actual_outcome[iteration]==0)
		{
			update_bit[iteration]=pre_bit[iteration];			
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state2();
		}	
		else if(actual_outcome[iteration]==1)
		{
			update_bit[iteration]=pre_bit[iteration];
			iteration++;
			pre_bit[iteration]=update_bit[iteration-1];
			state3();
		}
	}
	 
}



int main (void)
{
	
	iteration=0;
        int k=0;						
        //state can be 0,1,2,3
	//0=SNT 1=WNT 2=WT 3=ST
        printf("Enter the first prediction bit\n'0' for not taken(NT)\n'1' for taken(T)\n");
	scanf("%d",&pre_bit[0]);
 	if(pre_bit[0]==0)
		state0();   				//SNT        	
	else if(pre_bit[0]==1)
		state3();                               //ST
 	
	 printf("Iteration\tPrediction Bit\tActual Outcome\tUpdate\t\tState\n");
        for( k=0;k<no;k++)
	{
		printf("%d\t\t",k+1);
		if(pre_bit[k]==0)
			printf("NT\t\t");
		else
            		printf("T\t\t");
		if(actual_outcome[k]==0)
			printf("NT\t\t");
		else
            		printf("T\t\t");
		if(update_bit[k]==0)
			printf("NT\t\t");
		else
            		printf("T\t\t");
		if(state[k]==0)
                        printf("SNT=0\n");
  		else if(state[k]==1)
                        printf("WNT=1\n");
		else if(state[k]==2)
                        printf("WT=2\n");
		else if(state[k]==3)
                        printf("ST=3\n");
		
	}
	return(0);
}

