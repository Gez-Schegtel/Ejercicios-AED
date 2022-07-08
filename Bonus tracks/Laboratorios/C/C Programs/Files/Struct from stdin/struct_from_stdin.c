#include <stdio.h>
#include <string.h>

struct datos_empleado {
	char nombre[30];
	int edad;
};

int main(void) {

	/* Declaramos la variable fichero como puntero a FILE. */
	FILE *fichero;

	struct datos_empleado empleado;

	/* Abrimos "empleados.dat" en modo texto y
	 * guardamos su direccion en el puntero. */
	fichero = fopen("empleados.dat", "wb");

	if (fichero == NULL) {
		printf("Error: No se ha podido crear el fichero empleados.dat");
	} else {
		int n;

		/* Se pide al usuario que introduzca
		 * los datos de 3 empleados. */
		for(n=0;n<=2;n++){
			fflush (stdin);
			printf("\nNombre: ");
			scanf("%s", empleado.nombre);
			printf("Edad: ");
			scanf("%d", &empleado.edad);
			fwrite(&empleado, sizeof(empleado), 1, fichero);
		}

		/* Cerramos "empleados.dat". */
		fclose(fichero);
	}
}
