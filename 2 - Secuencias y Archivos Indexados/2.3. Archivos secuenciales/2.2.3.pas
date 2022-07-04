
Dada la siguiente secuencia de datos con el siguiente formato:

	Nº de socio
	Nº de teléfono
	Apellido y Nombre
	Carrera (ISI - IEM - IQ - LAR)
	Domicilio
	Cantidad de unidades prestadas

Correspondiente a los alumnos socios de la Biblioteca, generar la secuencia de los alumnos de “ISI” que tengan prestadas más de 4 unidades bibliográficas.

Acción 223 ES;
Ambiente
	alumnos_bib = registro
		nums: n(4); 
		numt: n(4);
		ayn: an(30);
		car: ('isi', 'iem', 'iq', 'lar');
		dom: an(45);
		cant_prest: n(2);
	fin_registro
	
	arch_al: archivo de alumnos_bib;
	reg_al: alumnos_bib;
	
	arch_al_sally: archivo de alumnos_bib;
	
Proceso
	alrir e/(arch_al);
	leer(arch_al, reg_al);
	
	alrir /s(arch_al_sally);
	
	Mientras NFDA(arch_al) hacer
		si (reg_al.car = 'isi') y (reg_al.cant_prest > 4) entonces
			esc(arch_al_sally, reg_al); // esto se puede hacer porque son iguales los registros
		fin_si
		
		leer(arch_al. reg_al);	
	Fin_Mientras
	
	cerrar(arch_al);
Fin_Acción.










