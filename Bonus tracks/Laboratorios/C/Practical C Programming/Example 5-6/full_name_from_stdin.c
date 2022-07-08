
#include <stdio.h>
#include <string.h>

char first[100]; /* First name of person we are working with */
char last[100]; /* His last name */
char full_name[200]; /* First and last name of the person (computed) */

int main(void){
    printf("Enter first name: ");
    fgets(first, sizeof(first), stdin);
    /* Trim off last character */
    first[strlen(first)-1] = '\0'; /* '\0' is the NULL character */

    printf("Enter last name: ");
    fgets(last, sizeof(last), stdin);
    /* Trim off last character */
    last[strlen(last)-1] = '\0';

    strcpy(full_name, first);
    strcat(full_name, " ");
    strcat(full_name, last);

    printf("The name is %s\n", full_name);

    return(0);
}
