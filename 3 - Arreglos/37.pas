Ejercicio 3.7
Escribir un algoritmo que permita localizar un nombre en un arreglo de N nombres, ordenados alfabéticamente. Cada nombre puede tener, como máximo, 10 caracteres. 
Escriba por lo menos dos algoritmos que permitan solucionar el problema; especifique cuál de las formas considera más eficiente y por qué.

Acción 3.7 es
	
	Ambiente
		N=30
		arr1: arreglo [1..N] de an(10)
		i: entero
		nombre: an(10)
		pos_b:entero
		der:entero
		izq:entero
		cen:entero	


	Proceso
		//esto que hicimos acá es un carga
		Para i:= 1 hasta 30 hacer 
			Escribir ('Ingrese un nombre de hasta 10 caracteres')
			Leer (arr1[i])
		Fin_Para

		//Usamos acá la búsqueda lineal con centinela 
		Escribir ('Ingrese el nombre que quiere encontrar')
		Leer(nombre)
		pos_b:=1

		Mientras (pos_b =< N) y (arr1[pos_b] <> nombre) hacer
   			pos_b:=pos_b+1
		Fin_Mientras

		Si (arr1[pos_b] = nombre) entonces 
		    Escribir ('El elemento', nombre, 'se encontró en la posición', pos_b)
		Sino
		    Escribir ('No encontrado')
		Fin SI

		//Ahora usamos la búsqueda binaria o dicotómica
		Escribir ('Ingrese el nombre que quiere encontrar')
		Leer(nombre)
		izq:=1
		der:=N
		
		cen:=(izq+der) DIV 2
		
		MIENTRAS (izq < der) y (arr1[cen] <> nombre) hacer
		    SI (arr1[cen] > nombre) ENTONCES
		        der:=cen-1
		    SINO
		        izq:=cen+1
		    FIN SI
		    cen:=(izq+der) div 2;
		Fin_Mientras
		
		SI (arr1[cen] = nombre) ENTONCES
		    ESCRIBIR ('El elemento buscado está en la posición ',cen)
		SINO
		    ESCRIBIR ('El elemento buscado no está en el arreglo');
		FIN SI
		
Fin_Acción