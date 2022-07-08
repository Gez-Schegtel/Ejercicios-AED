
/*
	Esta función pretende separar un nombre ingresado con el siguiente formato...

		Velazco Gez Schegtel/Juan Ignacio

	... devolviendo lo siguiente:

		Nombre: Juan Ignacio Apellido: Velazco Gez Schegtel

	Si no se agrega el slash (/) el programa arroja un error.


	IMPORTANTE RECORDAR: En C, a diferencia de Pseudocódigo, podemos imprimir
						un arreglo de caracteres de la siguiente forma...

	#include <stdio.h>

	int main(void){
	        char array[5] = {'0','3','4','2','1'};

	        printf("%s\n", array);

	        return(0);
	}

*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
my_strchr >> Finds a character in a string

Parameters
	string_ptr >> String to look through

	find >> Character to find

Returns
	Pointer to 1st occurrence of character in string or NULL for error
*/

char *my_strchr(char *string_ptr, char find){

	while (*string_ptr != find){

		/* Check for end */
		if (*string_ptr == '\0') /* \0 is the end-of-line character */
			return(NULL); /* Not found */

		printf("Analizando... %c\n", *string_ptr);
		string_ptr++;
	}

	printf("Se encontró el slash!\n");

	return(string_ptr); /* Found */
}

int main(void){

	char line[80]; /* The input line */654987
	char *first_ptr; /* Pointer to the first name */
	char *last_ptr; /* Pointer to the last name */

	fgets(line, sizeof(line), stdin);

	line[strlen(line)-1] = '\0'; /* Sacamos el salto de línea (\n) ubicado antes del end-of-line ('\0') que se genera por defecto en la función fgets */

	last_ptr = line; /* Last name is at beginning of line */
	printf("Línea original: %s. Esto está ubicado en la variable >>last_ptr<< \n", last_ptr);

	first_ptr = my_strchr(line, '/'); /* Find slash */
	printf("Se retornó: %s Esto está ubicado en la variable >>first_ptr<<\n", first_ptr);

	/* Check for an error */
	if (first_ptr == NULL){
		fprintf(stderr, "Error: No se encontró el slash %s\n", line);

		exit(8);
	}

	printf("\nAhora en >>last_ptr<< tenemos: %s\n", last_ptr);
	printf("Ahora en >>first_ptr<< tenemos: %s\n", first_ptr);

	*first_ptr = '\0'; /* Le sacamos el slash y le damos end-of-string */

	printf("\nAhora en >>last_ptr<< tenemos: %s\n", last_ptr);
	printf("Ahora en >>first_ptr<< tenemos: %s\n", first_ptr);

	first_ptr++; /* Nos movemos de la posición donde estaba el slash en la cual ahora hay un end-of-string. Esto nos deja en la primer letra del nombre. */
	printf("\nNombre: %s Apellido: %s\n", first_ptr, last_ptr);

	return(0);
}
