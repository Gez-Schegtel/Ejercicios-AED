


Del archivo general de alumnos de la U.T.N. - Facultad Regional Resistencia, ordenado por carrera, se desea emitir la cantidad de alumnos correspondientes a cada carrera y el total general.


Acción 2110 ES;
Ambiente
	alumno = registro
		car: ('isi', 'iq', 'iem', 'lar');
		ayn: an(30);
		dni: n(8);
	fin_registro
	
	arch_al: archivo de alumno ordenado por car; 
	reg_al: alumno;
	
	res_car: ('isi', 'iq', 'iem', 'lar');
	
	cont_car: entero;
	cont_tot: entero;
	
	procedimiento corte_carrera;
		
		esc('Los alumnos de ', res_car, ' son >> ', cont_car);
		
		cont_tot:= cont_tot + cont_car;
		cont_car:= 0;
		
		res_car:= reg_al.car;
		
	fin_procedimiento

Proceso
	abrir E/(arch_al);
	leer(arch_al, reg_al);
	
	res_car:= reg_al.car;

	cont_car:= 0;
	cont_tot:= 0;

	mientras NFDA(arch_al) hacer
		
		si (reg_al.car <> res_car) entonces
			corte_carrera;
		fin_si
		
		cont_car:= cont_car + 1;
	
		leer(arch_al, reg_al);
	
	fin_mientras
	
	corte_carrera;
	
	esc('El total de alumnos es >> ', cont_tot);

	cerrar(arch_al);
Fin_Acción.














