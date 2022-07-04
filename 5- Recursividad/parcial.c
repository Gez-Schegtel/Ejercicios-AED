
/*
Función recursiva que devuelve el menor de los números en un arreglo con 5 números enteros.

El arreglo se cargará de forma aleatoria haciendo uso de las funciones srand(), rand() y time(). Esta última
posiciona el seed en diferentes posiciones a medida que transcurre el tiempo.

Para que no se generen números excesivamente grandes los números generados estarán en un rango de 0 a 50.

Para más información acerca de las funciones utilizadas en este programa puede visitar los siguientes links:

srand() y rand(): https://www.programiz.com/cpp-programming/library-function/cstdlib/srand

time(): https://www.programiz.com/cpp-programming/library-function/ctime/time


	Caso base: i > 4 ==> return min;

	Caso recursivo: i <= 4 ==> if (v[i] < min) {min = v[i]}; fr(i+1)

*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int i, min, v[5];

void carga_y_emision(void);

int fr(int i);

int main(void){
	carga_y_emision();

	i = 0; min = 51;
	printf("\nEl número más pequeño en el arreglo es >> %d\n", fr(i));

	return(0);
}

void carga_y_emision(void){
	srand(time(NULL));
	for (i = 0; i <= 4; i++){
		v[i] = rand() % 50;
		printf("%d ", v[i]);
	}
}

int fr(int i){
	if (i > 4) {
		return min;
	} else {
		if (v[i] < min)
			min = v[i];

		fr(i+1);
	}
}
