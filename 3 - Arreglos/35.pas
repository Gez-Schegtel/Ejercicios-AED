

Dados 2 vectores:

A: arreglo [1 .. 30] de reales B: arreglo [1 .. 30] de reales

Ambos ordenados de forma creciente, escribir un algoritmo que realice la mezcla de ambos para obtener otro vector tambien ordenado de forma creciente

C: arreglo [1 .. 60] de reales


Acción 35 ES;
Ambiente 
	arr1: arreglo [1..30] de reales;
	arr2: arreglo [1..30] de reales;
	arr3: arreglo [1..60] de reales;
	
	i: entero;
	
	// Suponer que el usuario no va a ingresar cualquier milonga.
	procedimiento carga ES;
	proceso
		esc('Ingrese en orden creciente números reales al vector 1.');
		
		para i:= 1 hasta 30 hacer
			leer(arr1[i]);	
		fin_para
		
		esc('Ingrese en orden creciente números reales al vector 2.');
		
		para i:= 1 hasta 30 hacer 
			leer(arr2[i]);
		fin_para
		
	fin_procedimiento
	
Proceso
	carga;
	
	para i:= 1 hasta 30 hacer
		arr3[i]:= arr1[i];
	fin_para
	
	para i:= 30 hasta 60 hacer
		arr3[i]:= arr2[i];
	fin_para
	
	//Aplico inserción directa men-may
	para i:= 2 hasta 60 hacer
		x:= arr3[i]; //Resguarda el dato actual
		j:= i-1; //Resguarda la posición anterior
		
		mientras (j > 0) y (x < arr3[j]) hacer
				arr3[j+1]:= arr3[j];
				j:= j-1;
		fin_mientras
		arr3[j+1]:= x;
	fin_para
	
Fin_Acción.















