

Construir un algoritmo que a partir de un fichero de películas nuevas conteniendo:

PELICULAS_NUEVAS Ordenado por Nro_Pelicula

    Nro_Pelicula Titulo Genero Cant_Copias Fecha_Estreno 

y otro fichero de peliculas existentes, ambos ordenados por película,

PELICULAS Ordenado por Nro_Pelicula

    Nro_Pelicula Titulo Genero Cant_Copias Fecha_Estreno 

Genere un único archivo (con el mismo formato de los ficheros de entrada) que contenga todas las peliculas. Considerar que hay un solo registro por película y no se repiten entre ficheros.



//No voy a utilizar el ciclo excluyente porque me parece una poronga

Acción 2216 ES;
Ambiente
	fecha = registro
		aaaa: n(8);
		mm: 1..12;
		dd: 1..31;	
	fin_registro
	
	movie = registro
		nro_pelicula: n(3);
		titulo: an(40);
		genero: an(40);
		cant_copias: n(4);
		fecha_estreno: fecha;
	fin_registro
	
	{
	Como los dos archivos de entrada son iguales, y me pide que el de salida también
	sea del mismo tipo, puedo decir que la mezcla será del tipo "directa"
	}
	
	//archivo de entrada 1
	peliculas_nuevas: archivo de movie ordenado por nro_pelicula;
	reg_peliculas_nuevas: movie;
	
	//archivo de entrada 2
	peliculas: archivo de movie ordenado por nro_pelicula;
	reg_peliculas: movie;
	
	//archivo de salida con la mezcla entre 1 y 2
	arch_sal: archivo de movie ordenado por nro_pelicula
	reg_sal: movie;
	
	procedimiento leer_peliculas_nuevas ES;
	proceso
		leer(peliculas_nuevas, reg_peliculas_nuevas);
		
		si FDA(peliculas_nuevas) entonces
			reg_peliculas_nuevas:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento leer_peliculas ES;
	proceso
		leer(peliculas, reg_peliculas);	
		
		si FDA(peliculas) entonces
			reg_peliculas:= HV;
		fin_si
	fin_procedimiento

Proceso
	abrir e/(peliculas_nuevas);
	leer_peliculas_nuevas;
	
	abrir e/(peliculas);
	leer_peliculas;
	
	abrir /s(arch_sal);
	
	mientras (reg_peliculas_nuevas.nro_pelicula <> HV) o (reg_peliculas.nro_pelicula <> HV) hacer
		
		si (reg_peliculas_nuevas.nro_pelicula < reg_peliculas.nro_pelicula) entonces
		
			reg_sal:= reg_peliculas_nuevas
			leer_peliculas_nuevas
			
		sino	
			reg_sal:= reg_peliculas;
			leer_peliculas;	
				
		fin_si
		
		esc(arch_sal, reg_sal);
		
	fin_mientras

	cerrar(peliculas_nuevas);
	cerrar(peliculas);
Fin_Acción.














