
/*
Counts the number of characters in the file input.txt

To know:
    The function fgetc reads a single character from a file. If no more data exists in the
    file, the function will return the constant EOF (EOF is defined in stdio.h). Note that
    fgetc returns an integer, not a character. This return is necessary because the EOF
    flag must be a noncharacter value.
*/

#include <stdio.h>
#include <stdlib.h>

const char FILE_NAME[] = "input.txt";

int main(void){
    int count = 0; /* numbers of characters seen */
    FILE *in_file; /* input file */
    int ch; /* character or EOF flag from input */

    in_file = fopen(FILE_NAME, "r"); /* "r" stands for reading */

    if (in_file == NULL){
        printf("Cannot open %s\n", FILE_NAME);
        exit(8);
    }

    /*
    while (1){
        ch = fgetc(in_file);

        if (ch == EOF)
            break;

        ++count;
    }
    */

    while ((ch = fgetc(in_file)) != EOF){
        ++count;
    }

    printf("Number of characters in %s is %d\n", FILE_NAME, count);

    fclose(in_file);

    return(0);
}
