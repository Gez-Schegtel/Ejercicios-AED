Ejercicio 3.7
Escribir un algoritmo que permita localizar un nombre en un arreglo de N nombres, ordenados alfabéticamente. Cada nombre puede tener, como máximo, 10 caracteres. 
Escriba por lo menos dos algoritmos que permitan solucionar el problema; especifique cuál de las formas considera más eficiente y por qué.

Ejercicio 3.8
Repita el ejercicio anterior, pero suponiendo que se precisa localizar todos los nombres que comienzan con una letra dada.


Acción 3.8 es
	Ambiente
		N=30
		arr1: arreglo [1..N] de an(10)
		i: entero
		letra: an(10)

	Proceso

		para i:= 1 hasta 30
			Escribir ('Ingrese un nombre')
			leer (arr1[i])
		fin_para

		//busqueda lineal 

		Escribir ("Ingrese la primer letra de los nombres que desea encontrar")
		Leer (letra)

		cont_letra:=0
		Para i:= 1 a N hacer
		  Si Arr1[i] = letra ENTONCES
		  	Escribir ('El nombre', Arr1[i], 'está en la posición', i)
		  Fin_si
		  cont_letra:=cont_letra+1
		Fin_para

		Escribir ("La cantidad de palabras encontradas que empiezan con la letra", letra, "es de", cont_letra)

Fin_Acción
