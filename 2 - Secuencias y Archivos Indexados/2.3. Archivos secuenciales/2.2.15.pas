

El organismo del cual dependen las escuelas de un distrito lleva un archivo con los registros para todos los alumnos de nivel secundario de ese distrito:

ALUMNOS Ordenado por Escuela, Año, División

    Escuela Año División Nombre Cant_Inasistencias 

Se introduce como dato el número de distrito y la cantidad de días de clase dictados en el año. El archivo está ordenado por número de escuela, año y división. Los alumnos que superan el 20% de las inasistencias están en situación de LIBRES, de lo contrario son REGULARES.

	Se desea conocer:
	
	Para cada división:
	- Cantidad de alumnos
	
	Para cada año:
	- Cantidad total de alumnos libres
	- Cantidad de alumnos regulares
	- Cantidad total de alumnos
	
	Todas las escuelas:
	- Cantidad total de alumnos
	- Porcentaje de alumnos libres. - Promedio de inasistencias por alumnos. 
	
	
	
Acción 2215 ES;
Ambiente
	alumno = registro 
		esc: an(40);
		ann: n(4);
		divi: an(10);
		name: an(30);
		c_inas: n(2);
	fin_registro
	
	arch_al: archivo de alumno ordenado por esc, ann, divi;
	reg_al: alumno;
	
	clases: entero;
	distrito: entero;
	cont_al_divi: entero;
	
	res_esc: an(40);
	res_ann: n(4);
	res_divi: an(40);

	cont_al_divi: entero;
	cont_al_year: entero;
	cont_al_esc: entero;
	cont_al_reg: entero;
	cont_al_lib: entero;
	res_cont_al_divi: entero;
	res_cont_al_lib: entero;
	cont_c_inas: entero;
	
	procedimiento corte_divition ES;
		
		esc('En la escuela ', res_esc, ', en el año ', res_ann, ', en la división ', res_divi, ' hay ', cont_al_divi, ' alumnos.');
		esc('Y todo esto en el distrito ', distrito, '!!!!!!!!!!!!');
		
		cont_al_year:= cont_al_year + cont_al_divi;
		res_cont_al_divi:= cont_al_divi; 
		cont_al_divi:= 0; 
		
		res_divi:= reg_al.divi;
	fin_procedimiento
	
	procedimiento corte_year ES;
		
		corte_divition;
		
		esc('En la escuela ', res_esc, ', en el año ', res_ann, ' hay ', cont_al_year, ' alumnos.');
		esc('En la misma se encontraron ', cont_al_reg, ' alumnos regulares.');		
		esc('En la misma se encontraron ', cont_al_lib, ' alumnos libres.');
		
		cont_al_esc:= cont_al_esc + cont_al_year;
		cont_al_year:= 0;
		cont_al_reg:= 0;
		
		res_cont_al_lib:= cont_al_lib;
		cont_al_lib:= 0;
		
		res_ann:= reg_al.ann;
	fin_procedimiento
	
	procedimiento corte_escuela ES;
	
		corte_year;
		
		esc('En la escuela ', res_esc, ' hay ', cont_al_esc, ' alumnos.');
		esc('En la misma hay ', (res_cont_al_lib * 100)/res_cont_al_divi, '% de alumnos libres.');
		esc('El promedio de inasistencias es ', cont_c_inas/cont_al_esc, ' por alumno.');
		
		res_esc:= reg_al.esc;
	fin_procedimiento
	
	
Proceso
	abrir E/(arch_al);
	leer(arch_al, reg_al);

	esc('Ingrese el número de distrito.');
	leer(distrito);
	
	esc('Ingrese la cantidad de clases dictadas en el año.');
	leer(clases);

	res_esc:= reg_al.esc;
	res_ann:= reg_al.ann;
	res_divi:= reg_al.divi;
	
	cont_al_divi:= 0;
	cont_al_year:= 0;
	cont_al_esc:= 0;
	cont_al_reg:= 0;
	cont_al_lib:= 0;
	res_cont_al_divi:= 0;
	res_cont_al_lib:= 0;
	cont_c_inas:= 0;

	mientras NFDA(arch_al) hacer
		
		si (res_esc <> reg_al.esc) entonces
			corte_escuela;
		sino
			si (res_ann <> reg_al.ann) entonces
				corte_year;
			sino
				si (res_divi <> reg_al.divi) entonces
					corte_divition;
				fin_si
			fin_si
		fin_si
		
		si ((reg_al.c_inas*100)/clases > 20) entonces
			cont_reg:= cont_reg + 1;
		sino
			cont_lib:= cont_lib + 1:
		fin_si
		
		cont_al_divi:= cont_al_divi + 1;
		
		cont_c_inas:= cont_c_inas + reg_al.c_inas;
	
		leer(arch_al, reg_al);
	fin_mientras
	
	corte_escuela;
	
	cerrar(arch_al);
Fin_Acción.














