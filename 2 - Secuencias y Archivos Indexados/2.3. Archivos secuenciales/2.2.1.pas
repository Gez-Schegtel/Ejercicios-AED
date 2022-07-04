
Se dispone de una secuencia con los datos de los alumnos de la facultad:

    Apellido y Nombre
    Carrera (ISI - IEM - IQ)
    Nº de Legajo
    Fecha de Nacimiento
    Fecha de Ingreso
    D.N.I.
    Sexo (M o F)
    Fecha de último examen aprobado
    Nota

Se desea un listado de los mismos, con el siguiente formato:

    Nro_Legajo Apellido_Nombre Documento Carrera 
    

Acción 221 ES;
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
	
	arch_al: archivo de alumno
	reg_al: alumno
	
Proceso
	abrir e/(arch_al);
	leer(arch_al, reg_al);
	
	esc('Número de legajo | Apellido y nombre | Documento | Carrera');
	
	Mientras NFDA(arch_al) hacer
		esc(reg_al.leg);
		esc(reg_al.ayn);
		esc(reg_al.dni);
		esc(reg_al.car);
		
		leer(arch_al, reg_al)
	Fin_Mientras
	
	cerrar(arch_al);
Fin_Acción.
