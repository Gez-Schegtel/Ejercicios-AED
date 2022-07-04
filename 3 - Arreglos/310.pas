

Ejercicio 3.10

Dado un arreglo de 50 elementos, cada uno de los cuales tiene los siguientes datos: Código de localidad y Lluvia caída en un año. Escribir un algoritmo que permita saber dada una localidad, cuanto llovió en el año. Aplicar el método más adecuado considerando que el arreglo esta ordenado por Código de localidad.



Acción 31 ES;
Ambiente
	lluvias = registro
		cod_loc: n(4);
		lts_ll: n(2);
	fin_registro
	
	arr1: arreglo [1..50] de lluvias;
	i: entero;
	
	procedimiento (carga) ES;
	proceso
		para i:= 1 hasta 50 hacer 
			esc('Ingrese el código de la localidad.');
			leer(arr1[i].cod_loc);
			
			esc('Ingrese en litros la cantidad de agua.');
			leer(arr1[i].lts_ll);
		fin_para
	fin_procedimiento
	
	u_cod_loc: n(4);
	//Variables para la búsqueda lineal con centinela.
	pos_b: entero;
	
	//Variables para la búsqueda binaria o dicotómica.
	izq: entero;
	der: entero; 
	cen: entero;
	
Proceso
	carga;
	
	esc('Ingrese la localidad de la que desee conocer los litros de lluvia.');
	leer(u_cod_loc);
	
	//Búsqueda lineal con centinela
	{
	Como el arreglo no tiene muchos elementos, consideramos 
	con Agus que este método es el más eficiente.
	} 
	pos_b:= 1;
	
	mientras (pos_b < 50) y (arr1[pos_b].cod_loc <> u_cod_loc) hacer 
		pos_b:= pos_b + 1;
	fin_mientras
	
	si (arr1[pos_b].cod_loc = u_cod_loc) entonces
		esc('En la localidad ', u_cod_loc, ' llovieron ', arr1[pos_b].lts_ll);
	sino
		esc('No se encontró la localidad solicitada.');
	fin_si

	//Búsqueda binaria o dicotómica.
	//Hacemos este método para practicar
	izq:= 1;
	der:= 50;
	cen:= (izq + der) DIV 2;
	
	mientras (izq < der) y (arr1[cen].cod_loc <> u_cod_loc) hacer 
		si (arr1[cen].cod_loc > u_cod_loc) entonces
			der:= cen - 1;
		sino
			//arr1[cen].cod_loc < u_cod_loc
			izq:= cen + 1;
		fin_si
		
		cen:= (izq + der) DIV 2;		
	fin_mientras
	
	si (arr1[cen].cod_loc = u_cod_loc) entonces
		esc('En la localidad ', u_cod_loc, ' llovieron ', arr1[cen].lts_ll);
	sino
		esc('No se encontró la localidad solicitada.');
	fin_si

Fin_Acción.
		
		















