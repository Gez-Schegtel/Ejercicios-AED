

Escribir un algoritmo que permita cargar un arreglo de N nombres, considerando que cada nombre debe tener entre 1 y 10 caracteres.


Acción 36 ES;
Ambiente
	N = 30;
	
	arr: arreglo [1..N] de an(10); 
	
	i: entero;
	
Proceso
	
	para i:= 1 hasta N hacer 
	
		esc('Ingrese un nombre para la posición ', i);
		leer(arr[i]);
	
	fin_para
	
Fin_Acción.


