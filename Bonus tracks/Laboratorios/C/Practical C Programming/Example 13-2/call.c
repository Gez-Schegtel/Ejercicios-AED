
#include <stdio.h>

void inc_count(int *count_ptr){
    (*count_ptr)++; /* now, we are working with count from here */
}

int main(void){
    int count = 0; /* number of times through */

    while (count < 10)
        inc_count(&count); /* sending count's address to the function */

    printf("Count value >> %d\n", count);
    return(0);
}
