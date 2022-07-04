
A partir de la secuencia del ejercicio 2.01 se desea generar otra secuencia con los alumnos de una carrera dada que aprobaron alguna materia este año, con nota mayor a 7 (siete).

Acción 224 ES;
Ambiente
	fecha = registro
		dd: 1..31;
		mm: 1..12;
		aaaa: n(4);
	fin_registro

	alumno = registro
		ayn: an(30);
		car: ('isi', 'iem', 'iq', 'lar');
		leg: n(5);
		f_n: Fecha;
		f_i: Fecha;
		dni: n(8);
		sex: ('m', 'f');
		f_e: Fecha;
		nota: 1..10;
	fin_registro
	
	arch_al: archivos de alumno;
	reg_al: alumno;
	
	arch_al_sally: archivo de alumno;
	
	user_car: ('isi', 'iem', 'iq', 'lar');
	user_an: n(4);
	
Proceso
	abrir E/(arch_al);
	leer(arch_al, reg_al);
	
	abrir /s(arch_al_sally);
	
	esc('Ingrese la carrera sobre la que desee hacer la evaluación.');
	leer(user_car);
	esc('Ingrese el año actual.');
	leer(user_an);
	
	Mientras NFDA(arch_al) hacer
		si (reg_al.car = user_car) y (reg_al.f_e.aaaa = user_an) y (reg_al.nota > 7) entonces
			esc(arch_al_sally, reg_al);
		fin_si
		
		leer(arch_al, reg_al);
	Fin_Mientras

	cerrar(arch_al);
Fin_Acción.





