
#include <stdio.h>

char line[100]; /* input line from console */
int value; /* a value to double */

int main(void){
    printf("Enter a value: ");

    fgets(line, sizeof(line), stdin); /* fgets reads a line... */
    sscanf(line, "%d", &value); /* ... and sscanf converts the text into numbers */

    printf("Twice %d is %d\n", value, value*2);

    return(0);
}
