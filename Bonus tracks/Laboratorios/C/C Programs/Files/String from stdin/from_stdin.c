/*
En el siguiente programa se escribe en el fichero "archivo1.txt" una frase que se le pide introducir al usuario:
*/

#include <stdio.h>
#include <string.h>

int main(void) {

	/* Declaramos la variable fichero como puntero a FILE. */
	FILE *fichero;

	/* Declaramos la variable frase de tipo array. */
	char frase[100];

	/* Abrimos "fichero1.txt" en modo texto y
	 * guardamos su direccion en el puntero. */
	fichero = fopen("fichero1.txt", "wt");

	if(fichero == NULL) {
		printf("Error: No se ha podido crear el fichero archivo1.txt");
	} else {

		/* Se pide al usuario que introduzca una frase. */
		printf("Escriba una frase: ");
		fgets(frase, sizeof(frase), stdin);

		/* Escribimos dentro de "fichero1.txt". */
		fwrite(&frase, strlen(frase), 1, fichero);

		/* Cerramos "fichero1.txt". */
		fclose(fichero);
	}
}
