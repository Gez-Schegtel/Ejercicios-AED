



Se dispone de un archivo con datos de los alumnos de la U.T.N. con la siguiente información para cada alumno:


PRODUCTOS Ordenado por Sexo, Carrera, Nro_Legajo

    | Sexo | Carrera | Nro_Legajo | Fecha_Ingreso | Total_Materias_Aprobadas |


Se desea un listado con el siguiente detalle por sexo, carrera y total general

    Total de alumnos que ingresaron en el año 2009 con más de 20 materias aprobadas.

    Total de alumnos que ingresaron en el año 2009 con menos de 20 materias aprobadas.





Acción 2211 ES;
Ambiente
	fecha = registro
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro	
	
	alumno = registro
		sex: ('m', 'f');
		car: ('isi', 'iem', 'iq', 'lar');
		leg: n(5);
		f_i: fecha;
		mat_a: n(2);
	fin_registro
	
	arch_al: archivo de alumno ordenado por sex, car, leg;
	reg_al: alumno;
	
	res_sex: ('m', 'f');
	res_car: ('isi', 'iem', 'iq', 'lar');
	
	cont_carM: entero;
	cont_carm: entero;
	
	cont_sexM: entero;
	cont_sexm: entero;
	
	contot_M: entero;
	contor_m: entero;
		
	//corte de menor nivel
	procedimiento corte_carrera ES;
		
		esc('Los ', res_sex, ' de la carrera', res_car, ' que aprobaron más de 20 materias en el 2009 son ', cont_carM);
		esc('Los ', res_sex, ' de la carrera', res_car, ' que aprobaron menos de 20 materias en el 2009 son ', cont_carm);
		
		cont_sexM:= cont_sexM + cont_carM;
		cont_sexm:= cont_sexm + cont_carm;
		
		cont_carM:= 0;
		cont_carm:= 0;
		
		res_car:= reg_al.car;
		
	fin_procedimiento
	
	//corte de mayor nivel
	procedimiento corte_sexo ES;
		
		// siempre se llama al corte de menor nivel anterior */*
		corte_carrera;
		
		esc('Los ', res_sex, ' que aprobaron más de 20 materias en el 2009 son ', cont_sexM);
		esc('Los ', res_sex, ' que aprobaron menos de 20 materias en el 2009 son ', cont_sex);
		
		contot_M:= contot_M + cont_sexM;	
		contor_m:= contot_m + cont_sexm;

		cont_sexM:= 0;	
		cont_sexm:= 0;	
		
		res_sex:= reg_al.sex;
	
	fin_procedimiento
	

Proceso
	abrir E/(arch_al);
	leer(arch_al, reg_al);
	
	res_sex:= reg_al.sex;
	res_car:= reg_al.car;
	
	cont_carM:= 0;
	cont_carm:= 0;

	cont_sexM:= 0;
	cont_sexm:= 0;

	contot_M:= 0;	
	contor_m:= 0;
	
	mientras NFDA(arch_al) hacer
	
		// condicionales de corte
		si (res_sex <> reg_al.sex) entonces
			corte_sexo;
		sino
			si (res_car <> reg_al.car) entonces
				corte_carrera;
			fin_si
			
		fin_si
		
		// lo que nos pide el problema
		si (reg_al.f_i.aaaa = 2009) y (reg_al.mat_a > 20) entonces
			cont_carM:= cont_carM + 1;
		sino
			si (reg_al.f_i.aaaa = 2009) y (reg_al.mat_a < 20) entonces
				cont_carM:= cont_carm + 1;
			fin_si
		fin_si
	
		leer(arch_al, reg_al);
	fin_mientras
	
	// el concepto de llamarlo acá es lo mismo que se hace en la línea 73 */*
	corte_sexo;
	
	esc('El total de alumnos que aprobaron más de 20 materias son ', contot_M);
	esc('El total de alumnos que aprobaron menos de 20 materias son ', contot_m);
	
	cerrar(arch_al);
Fin_Acción.










