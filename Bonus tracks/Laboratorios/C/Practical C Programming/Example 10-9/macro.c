#include <stdio.h>
#define SQR(x) ((x) * (x))
int main()
{
	int counter;
	/*
	 * counter for loop
	 */
	counter = 1;
	while (counter <= 5){
		printf("x %d square %d\n", counter, SQR(counter));
        counter++;
    }
    return (0);
}
