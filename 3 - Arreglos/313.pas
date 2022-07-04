


Ejercicio 3.13

Se precisa ordenar un arreglo de N alumnos de mayor a menor, de acuerdo a la cantidad de materias aprobadas. Cada elemento del arreglo contiene Nro. de Legajo y Cantidad de materias aprobadas. Escriba por lo menos dos algoritmos que permitan solucionar el problema; especifique cuál de las formas considera más eficiente y por qué.


Acción 313 ES; 
Ambiente
	alumno = registro
		nro_l: n(4);
		mt_ap: n(2);
	fin_registro
	
	n = 100;
	arr1: arreglo [1..n] de alumno;
	
	procedimiento (carga) ES;
	proceso
		para i:= 1 hasta n hacer 
			esc('Número de legajo >> ');
			leer(arr1[i].nro_l);
			
			esc('Número de materias aprobadas >> ');
			leer(arr1[i].mt_ap);
		fin_para
	fin_procedimiento
	
	x_v: entero;
	i_p: entero;
	j_p: entero;
	

Proceso 
	//Inserción directa - menor/mayor
	
	para i_p:= 2 hasta n hacer
		
		x_v:= arr1[i_p].mt_ap;   // resguarda elemento de posición i
		
		j_p:= i_p - 1;   	 // resguarda posición anterior a i
	
		mientras (arr1[j_p].mt_ap > x_v) y (j_p > 0) hacer 
			
			arr1[j_p + 1].mt_ap:= arr1[j_p].mt_ap;
			
			j_p:= j_p - 1;
		
		fin_mientras
		
		arr1[j_p + 1].mt_ap:= x_v;
	
	fin_para 

	//Inserción directa - mayor/menor
	
	para i_p:= 2 hasta n hacer
		
		x_v:= arr1[i_p].mt_ap;   // resguarda elemento de posición i
		
		j_p:= i_p - 1;   	 // resguarda posición anterior a i
	
		mientras (arr1[j_p].mt_ap < x_v) y (j_p > 0) hacer 
			
			arr1[j_p + 1].mt_ap:= arr1[j_p].mt_ap;
			
			j_p:= j_p - 1;
		
		fin_mientras
		
		arr1[j_p + 1].mt_ap:= x_v;
	
	fin_para
	
		
	//Selección directa - mayor/menor
	
	para i_p:= 1 a n-1 hacer
		
		x_v:= arr1[i_p].mt_ap;
		máx:= i_p;
		
		para j_p:= (i_p + 1) a n hacer
			
			si (x_v < arr1[j_p].mt_ap) entonces
				x_v:= arr1[j_p].mt_ap; //elemento más grande
				máx:= j_p; //posición de este elemento
			fin_si
		
		fin_para
		
		arr1[máx].mt_ap:= arr1[i_p].mt_ap; //Donde estaba el más grande, ponemos el que ya teníamos
		arr1[i_p].mt_ap:= x_v; //Y donde estaba el que teníamos, va el más grande
	
	fin_para	

	
	//Selección directa - menor/mayor
	
	para i_p:= 1 a n-1 hacer
		
		x_v:= arr1[i_p].mt_ap;
		min:= i_p;
		
		para j_p:= (i_p + 1) a n hacer
			
			si (x_v > arr1[j_p].mt_ap) entonces
				x_v:= arr1[j_p].mt_ap; //elemento más grande
				min:= j_p; //posición de este elemento
			fin_si	
		
		fin_para
		
		arr1[min].mt_ap:= arr1[i_p].mt_ap; //Donde estaba el más grande, ponemos el que ya teníamos
		arr1[i_p].mt_ap:= x_v; //Y donde estaba el que teníamos, va el más grande
	
	fin_para

	// Búsqueda lineal con centinela //
	pos_b:= 1;

	mientras (pos_b < 100) y (arr1[pos_b].título <> u_título) hacer
		pos_b:= pos_b + 1;		
	fin_mientras 

	si (arr1[pos_b].título = u_título) y (arr1[pos_b].alquilado = 'n') entonces
		esc('La película está disponible.');
		arr1[pos_b].cant_vistas:= arr1[pos_b].cant_vistas + 1;
	sino 
		si (arr1[pos_b].título = u_título) y (arr1[pos_b].alquilado = 's') entonces
			esc('La película solicitada se encuentra alquilada.');
		sino
			esc('La película solicitada no se encuentra en el arreglo.'); 
		fin_si
	fin_si
	
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


Fin_Acción.
	















