


Ejercicio 3.12

A partir del arreglo de videos descrito en el ejercicio anterior, diseñe un algoritmo que permita atender un pedido de alquiler, para lo cual debe verificar si es posible o no y, cuando corresponda, actualizar la cantidad de personas que vieron dicha película.


Acción 312 ES;
Ambiente
	ghost_rider = registro
		título: an(40);
		nombre_d: n(40);
		cat_pel: an(30);
		cant_vistas: n(7);
		alquilado: ('s', 'n');
	fin_registro
	
	arr1: arreglo [1..100] de ghost_rider;
	i: entero;
	
	procedimiento (carga) ES;
	proceso
		para i:= 1 hasta 100 hacer 
			esc('Título de la película >> ');
			leer(arr1[i].título);
			
			esc('Nombre del director >> ');
			leer(arr1[i].nombre_d);
			
			esc('Categoría >> ');
			leer(arr1[i].cat_pel);
			
			esc('Cantidad de visualizaciones >> '):
			leer(arr1[i].cant_vistas);
			
			esc('Estado de alquiler s/n');
			leer(arr1[i].alquilado);
		fin_para
	fin_procedimiento
	
	u_título: an(40);
	pos_b: entero;
Proceso
	esc('Ingrese la película que desee alquilar: ');
	leer(u_título);
	
	//Búsqueda lineal con centinela
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
	
	{
	La primera versión que hicimos.
	
	si (arr1[pos_b].título = u_título) y (arr1[pos_b].alquilado = 'n') entonces
		esc('La película está disponible.');
		arr1[pos_b].cant_vistas:= arr1[pos_b].cant_vistas + 1;
	sino 
		si (arr1[pos_b].título <> u_título) entonces 
			esc('La película solicitada no se encuentra en el arreglo.');
		sino 
			si (arr1[pos_b].título = u_título) y (arr1[pos_b].alquilado = 's') entonces
				esc('La película solicitada se encuentra alquilada.');
			fin_si
		fin_si
	fin_si

	}
	
Fin_Acción.





	
	
	
	
	
A partir del arreglo de videos descrito en el ejercicio anterior, diseñe un algoritmo que permita atender un pedido de alquiler, para lo cual debe verificar si es posible o no y, cuando corresponda, actualizar la cantidad de personas que vieron dicha película.




