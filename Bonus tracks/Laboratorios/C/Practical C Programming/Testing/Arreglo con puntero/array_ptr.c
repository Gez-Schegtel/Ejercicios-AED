/*
Este programa utiliza punteros en vez de una variable utilizada como índice
para recorrer, cargar y obtener los datos de un arreglo
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 10 /* Máxima longitud del arreglo */

int array[MAX]; /* Arreglo */
int *array_ptr; /* Variable puntero para recorrer el arreglo */
int i; /* Variable para el ciclo manejado por contador */

char user_input[MAX]; /* La dimensión se elige a conveniencia según la cantidad posiciones que haya en el arreglo */
int user_value;

int main(void){
    //srand(time(NULL)); /* Ubicamos el seed en alguna posición aleatoria (opcional) */

    array_ptr = array; /* Es lo mismo que array_ptr = &array[0] */

    printf("          Elementos: ");

    for (i = 0; i < MAX; i++){
        *array_ptr = rand() % 9; /* Cargamos elemntos aleatorios en un rango de 9 */
        printf("%d ", *array_ptr);
        array_ptr++;
    }
    printf("\n                     ^ ^ ^ ^ ^ ^ ^ ^ ^ ^");
    printf("\nOrden de posiciones: 0 1 2 3 4 5 6 7 8 9");

    /* Agrego saltos de línea para evitar errores de formato en la consola */
    printf("\n\nSeleccione la posición del elemento que desee encontrar: ");
    fgets(user_input, sizeof(user_input), stdin);
    sscanf(user_input, "%d", &user_value);

    array_ptr = array; /* Reiniciamos la dirección en el puntero para poder recorrer el arreglo */

    while ((user_value < MAX) && (user_value != array_ptr - array)) /* La sentencia array_ptr - array devuelve las posiciones que se recorrieron, por lo que SIEMPRE devuelve número entre 0 y 9  */
        array_ptr++;

    if (user_value == array_ptr - array)
        printf("\nEn la posición %d se encuentra el elemento %d\n", user_value, *array_ptr);
    else
        printf("\nNo se encontró la posición.\n");

    printf("Se recorrieron %ld posiciones.\n", array_ptr - array); /* Sólo Dios sabe por qué hay que usar %ld en vez de %d. Si se usa %d el compilador arroja un warning */

    printf("\n\nIngrese el valor del elemento que desee encontrar: ");
    fgets(user_input, sizeof(user_input), stdin);
    sscanf(user_input, "%d", &user_value);

    array_ptr = array;

    while ((user_value != *array_ptr) && (array_ptr - array < MAX))
        array_ptr++;

    if (user_value == *array_ptr)
        printf("Se encontró el elemento: %d\n", *array_ptr);
    else
        printf("No se encontró el elemento.\n");

    return(0);
}
/*
Conclusiones:

    Según el autor Steve Oualline, en su libro Practical C Programming, el uso de punteros
    en lo que respecta a arreglos la forma más eficiente de trabajar.

    Sin embargo, yo no noté diferencias de rendimiento, sólo código un poco más fulero de
    escribir y entender. Supuse que hoy en día las CPUs y compiladores hacen mucho mejor
    su trabajo que antaño. Pero lo quise probar a ver qué pasaba.

    No creo que vuelva a escribir un código como este (creo).
*/
