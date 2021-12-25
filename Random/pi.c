// Code to find the value of pi using Monte Carlo sampling method.
// https://en.wikipedia.org/wiki/Monte_Carlo_algorithm

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#define seed 55656545

int main()
{
float n_trials = 4000, a;
int n_hits = 0;
double x,y;
srand(seed);

for (int i=0; i<n_trials; i++){
    x = (double)rand()/RAND_MAX;
    y = (double)rand()/RAND_MAX;
    if(x*x + y*y <= 1)
    { 
        n_hits += 1;
    }
}
a= 4.0 * n_hits / n_trials;
printf("The value of pi is: %f", a);

return 0;
}
