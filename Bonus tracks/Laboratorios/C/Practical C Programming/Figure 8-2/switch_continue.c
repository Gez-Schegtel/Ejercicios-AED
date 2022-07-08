/*
The program in Figure 8 -2 is designed to convert an integer with a number of
different formats into different bases. If you want to know the value of an octal
number, you would enter o ( for octal) and the number. The command q is used to
quit the program. For example:

Enter conversion and number: o 55
Result is 45
Enter conversion and number: q

The help command is special because we don't want to print a number after the
command. After all, the result of help is a few lines of text, not a number. So a
continue is used inside the switch to start the loop at the beginning. Inside the
switch, the continue statement works on the loop, while the break statement
works on the switch.

There is one break outside the switch that isdesigned to let the user exit the
program. The control flow for this program can be seen in Figure 8 -2.
*/

#include <stdio.h>

int number; /* number we are converting */
char type; /* type of conversion to do */
char line[80]; /* input line */

int main(void){
    while(1){
        printf("Enter conversion and number: ");

        fgets(line, sizeof(line), stdin);
        sscanf(line, "%c", &type);

        if ((type == 'q') || (type == 'Q'))
            break;

        switch(type){
            case 'o':
            case 'O':   /* octal conversion */
                sscanf(line, "%c %o", &type, &number);
                break;
            case 'x':
            case 'X':   /* hexadecimal conversion */
                sscanf(line, "%c %x", &type, &number);
                break;
            case 'd':
            case 'D':   /* decimal (for completeness) */
                sscanf(line, "%c %d", &type, &number);
                break;
            case '?':
            case 'h':   /* help */
                printf("Letter conversion \n");
                printf("    o Octal \n");
                printf("    x Hexadecimal \n");
                printf("    d Decimal \n");
                printf("    q Quit program \n");

                /* don't print the number */
                continue;
            default:
                printf("Type ? or h for help \n");
                /* don't print the number */
                continue;
        }
        printf("Result is %d\n", number);
    }
    return(0);
}
