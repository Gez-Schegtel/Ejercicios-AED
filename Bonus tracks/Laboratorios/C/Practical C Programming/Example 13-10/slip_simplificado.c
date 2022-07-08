
/*
    Este programa lo hice para simplificar el código de "split.c" con el motivo
    de entender mejor cómo funciona.
*/

/*
#include <stdio.h>

int main(void){
    char line[] = "River/Plate";

    char *first_ptr;
    char *last_ptr;

    int i;

    last_ptr = line;
    first_ptr = line;

    for (i = 0; i < 5; i++)
        last_ptr++;

    *last_ptr = '\0';
    last_ptr++;



    printf("Primera parte: %s\nSegunda parte: %s\n", first_ptr, last_ptr);
    return(0);
}
*/

/* En realidad, se puede hacer simplemente lo siguiente... */

#include <stdio.h>

char line[] = "River/Plate";
char *last_ptr;

void recorrer_el_arreglo(void);

int main(void){

    recorrer_el_arreglo();

    last_ptr = line;
    while (*last_ptr != '/')
        last_ptr++;

    *last_ptr = '\0'; /* Colocamos un \0 (end-of-string) para "borrar" el caracter slash (/) */
    last_ptr++; /* Avanzamos ese \0 para pararnos sobre la P de Plate ;-) */

    printf("Primera parte: %s\nSegunda parte: %s\n", line, last_ptr);
    return(0);
}

void recorrer_el_arreglo(void){
    printf("Recorremos el arreglo hasta hasta el end-of-string. \n");
    printf("Arreglo: ");

    last_ptr = line;
    while (*last_ptr != '\0'){
        printf("%c", *last_ptr);
        last_ptr++;
    }
    printf("\n\n");
}

/*
    ¿Y por qué este código funciona? Porque lo que estamos haciendo es lo siguiente:

    Vamos a trabajar sobre la línea "River/Plate"... ¿o no? No tan así, porque lo
    que realmente tenemos es:

            'R', 'i', 'v', 'e', 'r', '/', 'P', 'l', 'a', 't', 'e', '\0'

    Esto es lo que tiene almacenado el arreglo de caracteres >> line <<.

    Lo que hacemos es avanzar hasta el slash y quedamos parados acá:

            'R', 'i', 'v', 'e', 'r', '/', 'P', 'l', 'a', 't', 'e', '\0'
                                     ^^^
                         Estamos ahí  ^

    Luego, "borramos" el slash con el end-of-string y nos queda:

            'R', 'i', 'v', 'e', 'r', '\0', 'P', 'l', 'a', 't', 'e', '\0'
                                     ^^^
                         Estamos ahí  ^

    Avanzamos una posición:

            'R', 'i', 'v', 'e', 'r', '\0', 'P', 'l', 'a', 't', 'e', '\0'
                                           ^^^
                               Estamos ahí  ^

    Teniendo esto, al imprimir por pantalla la variable >> line << de esta manera

                                printf("%s", line);

    imprime...

                                River


    Lo mismo sucede si trabajamos con un puntero que al principio de todos le
    asignamos la variable line.
                                first_ptr = line;
                                printf("%s", first_ptr);
    imprime...
                                River.


    Esto es algo lógico, ya que el puntero first_ptr no es más que un puntero
    que apunta a la variable >> line <<.
*/
