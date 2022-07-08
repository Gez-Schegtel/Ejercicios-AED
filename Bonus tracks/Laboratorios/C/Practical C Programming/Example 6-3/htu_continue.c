
/*
This program is an example on how to use the >> continue << function.
*/

#include <stdio.h>

char line[100]; /* line from input */
int total; /* running total of all numbers so far */
int item; /* next item to add to the list */
int minus_items; /* number of negative items */

int main(void){

    while (1){
        printf("Enter # to add or 0 to stop: ");

        fgets(line, sizeof(line), stdin);
        sscanf(line, "%d", &item);

        if (item == 0)
            break;

        if (item < 0){
            ++minus_items;
            continue;
        }
        total += item;
        printf("Total: %d\n", total);
    }

    printf("Final total %d with %d negative items omitted \n", total, minus_items);

    return(0);
}
