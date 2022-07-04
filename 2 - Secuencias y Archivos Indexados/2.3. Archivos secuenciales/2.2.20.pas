



Se desea generar una secuencia, a partir de la secuencia del problema 2.01, donde se actualice la fecha de aprobación del último exámen, para ello se cuenta con información del último turno de exámen, según el siguiente detalle:

EXAMENES Ordenado por Nro_Legajo

    Nro_Legajo Carrera Cod_Materia Fecha_Examen Nota 

Se debe considerar que no necesariamente todos los alumnos se presentan en cada turno de exámen, y que un alumno puede presentarse a rendir más de una materia en un mismo turno. Supónganse ambas secuencias ordenadas por Número de Legajo.




Acción 2220 ES;
Ambiente
	fecha = registro 
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	alumno = registro
		ayn: an(30);
		car: ('isi', 'iem', 'iq', 'lar');
		nleg: n(5); //clave
		fnac: fecha;
		fing: fecha;
		dni: n(8);
		sex: ('m', 'f');
		fultex: fecha;
		nota: 1..10;
	fin_registro
	
	examen = registro 
		nleg: n(5); //clave
		car: ('isi', 'iem', 'iq', 'lar');
		codmat: n(5);
		fex: fecha;
		nota: 1..10;
	fin_registro
	
	archmaster: archivo de alumno ordenado por nleg;
	regmaster: alumno;
	
	archmasterACT: archivo de alumno ordenado por nleg;
	regmasterACT: alumno; 
	
	regmasterAUX: alumno;

	archmove: archivo de examen ordenado por nleg;
	regmove: examen;
	
	procedimiento leer_master ES;
	proceso
		leer(archmaster, regmaster);
		
		si FDA(archmaster) entonces
			regmaster.nleg:= HV; //asigno HV a la clave
		fin_si
	fin_procedimiento
	
	procedimiento leer_move ES;
	proceso
		leer(archmove, regmove);
		
		si FDA(archmove) entonces
			regmove.nleg:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento master_men_move ES;
	proceso
		//Significa que el alumno no rindió
		regmasterACT:= regmaster;
		esc(archmasterACT, regmasterACT);
		
		leer_master;
	fin_procedimiento
	
	procedimiento master_may_move ES;
	proceso
		//Es un error, no tendría que suceder en este caso
		esc('Error, el alumno que rindió el examen no se encuentra en el archivo de alumnos de la facultad.');
		
		leer_move;
	fin_procedimiento
	
	procedimiento master_eq_move ES;
	proceso
		regmasterAUX:= regmaster;
		
		mientras (regmaster.nleg = regmove.nleg) hacer
			
			si (regmove.nota >= 6) y (regmasterAUX.fultex < regmove.fex) entonces
				regmasterAUX.fultex:= regmove.fex; 
				regmasterAUX.nota:= regmove.nota;
			fin_si
			
			leer_move;
		fin_mientras

		leer_master;
		
		regmasterACT:= regmasterAUX;		
		esc(archmasterACT, regmasterACT);

	fin_procedimiento

Proceso
	abrir e/(archmaster);
	leer_master;
	
	abrir e/(archmove);
	leer_move;
	
	abrir /s(archmasterACT);
	
	mientras (regmaster.nleg <> HV) o (regmove.nleg <> HV) hacer 
		
		si (regmaster.nleg < regmove.nleg) entonces 
			master_men_move;
		sino
			si (regmaster.nleg > regmove.nleg) entonces
				master_may_move;
			sino
				master_eq_move;
			fin_si
		fin_si
		
	fin_mientras

	cerrar(archmaster);
	cerrar(archmasterACT);
	cerrar(archmove);
Fin_Acción.











