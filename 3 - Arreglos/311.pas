

Ejercicio 3.11

Dado un arreglo de 100 elementos, que contiene la siguiente información sobre videos: Título de la película, Nombre del Director, Categoría de película, Cantidad de personas que la vieron, Alquilado (si/no); y está ordenado por el Título de la película, diseñe un algoritmo que, ingresando una categoría, liste todas las películas que pertenecen a dicha categoría.




Acción 311 ES;
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
	
	u_cat_pel: an(30);
	
Proceso
	carga;
	
	esc('Ingrese la categoría de películas que desee listar >> ');
	leer(u_cat_pel);
	
	esc('Películas que pertencen a la categoría solicitada... ');
	para i:= 1 hasta 100 hacer 
		si (arr1[i].cat_pel = u_cat_pel) entonces
			esc(arr1[i].título);
		fin_si	
	fin_para
	

Fin_Acción.













