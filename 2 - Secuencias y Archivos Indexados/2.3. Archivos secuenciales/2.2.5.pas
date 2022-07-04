
A partir de la secuencia del ejercicio 2.01 se desea generar un listado con los alumnos que aprobaron la última materia rendida con nota superior a 7, e ingresaron el año pasado, con el siguiente formato:

Nro_Legajo Apellido_Nombre Carrera

Acción 225 ES;
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
	
	arch_al: archivo de alumno;
	reg_al: alumno;
	
	user_an: n(4);

Proceso
	abrir E/(arch_al);
	leer(arch_al, reg_al);
	
	esc('Ingrese el año pasado.');
	leer(user_an);
	
	esc('N° de Legajo | Apellido y Nombre | Carrera');
	
	Mientras NFDA(arch_al) hacer
		si (reg_al.f_e.aaaa = user_an) y (reg_al.nota > 7) entonces
			esc(reg_al.leg);
			esc(reg_al.ayn);
			esc(reg_al.car);
		fin_si
		
		leer(arch_al, reg_al);
	Fin_Mientras
	
	cerrar(arch_al);
Fin_Acción.




