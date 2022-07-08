
/*
	Command to compile this program: gcc main.c count.c -Wall (-Wall is optional)

	PD: The main.c and count.c files must be in the same directory
*/

#include <stdio.h>
/* number of times through the loop */
extern int counter;

/* routine to increment the counter */
extern void inc_counter(void);

int main(void){
	int index;			/* loop index */

	for (index = 0; index < 10; index++)
		inc_counter();

	printf("Counter is %d\n", counter);

	return(0);
}
