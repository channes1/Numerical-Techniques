#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>
#define seed 55656545
int main()
{
double x;
srand((unsigned)time(NULL));
float f, p = 0.1;
int N = 1000;

for (int n = 0; n < N; n++)
{   
    x = (float)rand()/RAND_MAX;
    f=1/pow((x-x*x),p);
}
printf("x is %f \n",x);
printf("f is %f",f);
//S = sum(f)*1/N;

    return 0;
}

