
G1 16 G2 17 G3 18 G4 16 G5 17 G6 18 g7 16 G8 17 G9 18 


La Secretaria Academica de la Facultad lanza un proyecto para incentivar a aquellos alumnos que realizaron el Cursillo de Ingreso a la Universidad y no lograron aprobarlo en los turnos de Agosto y Febrero, de manera de brindarles apoyo Academico con el fin de que, en el Cursillo del año siguiente puedan aprobar los examenes necesarios e ingresar a la Universidad.

Para esto, dicha Secretaria­necesita crear un archivo donde se encuentren todos los aspirantes que realizaron el Cursillo de Ingreso en ambos turnos, y no lograron aprobarlo.

Los datos correspondientes a cada uno de los turnos del Cursillo dictado están almacenados en dos archivos (uno para cada turno), los cuales presentan el siguiente formato:


ASPIRANTES Ordenado por DNI

    DNI ApeyNom Carrera F_Nac Email ColegioSec FechaInscripcion Aprobado (Si/No) 

UD debe realizar un algoritmo que permita mezclar los archivos Aspirantes (de Agosto y Febrero) y generar un archivo SEGUIMIENTO con el siguiente formato:


SEGUIMIENTO Ordenado por DNI

    DNI ApeyNom Email ColegioSec 

Al finalizar el proceso informar la cantidad de aspirantes que se grabaron en el archivo SEGUIMIENTO.



Acción 2117 ES;
Ambiente
	Fecha = Registro
		dd: 1..31;
		mm: 1..12;
		aaaa: N(4);
	Fin_Registro

	Aspirantes = Registro
		DNI: N(8);
		AyN: AN(30);
		Car: ('isi', 'iq', 'iem', 'lar');
		F_N: Fecha;
		email: AN(30);
		col_sec: AN(30);
		F_I: Fecha;
		Aprobado: ('s', 'n');
	Fin_Registro
	
	Seguimiento = Registro
		DNI: N(8);
		AyN: AN(30);
		email: AN(30);
		col_sec: AN(30);
	Fin_Registro
	
	arch_feb: archivo de Aspirantes ordenado por DNI;
	reg_feb: Aspirantes;
	
	arch_agos: archivo de Aspirantes ordenado por DNI;
	reg_agos: Aspirantes;
	
	arch_sal: archivo de Seguimiento ordenado por DNI;
	reg_sal: Seguimiento;
	
	cont: entero;

Proceso
	abrir E/(arch_agos);
	leer(arch_agos, reg_agos);
	
	abrir E/(arch_feb);
	leer(arch_feb, reg_feb);
	
	abrir /S(arch_sal);
	
	cont:= 0;
	
	
	//ciclo excluyente
	
	Mientras NFDA(arch_agos) y NFDA(arch_feb) hacer
	
		si (reg_feb.DNI < reg_agos.DNI) entonces
			leer(arch_feb, reg_feb);
		sino
			si (reg_feb.DNI > reg_agos.DNI) entonces
				leer(arch_agos, reg_agos);
			
			sino
				//si (reg_feb.DNI = reg_agos.DNI) entonces
				
				si (reg_feb.aprobado = 'n') entonces
					reg_sal.DNI:= reg_feb.DNI;
					reg_sal.AyN:= reg_feb.AyN;
					reg_sal.email:= reg_feb.email;
					reg_sal.col_sec:= reg_feb.col_sec;
					esc(arch_sal, reg_sal);
					
					cont:= cont + 1;
					
				fin_si
				
				leer(arch_agos, reg_agos);
				leer(arch_feb, reg_feb);
				//fin_si
			fin_si
		fin_si
	
	Fin_Mientras
	
	esc('Los alumnos que se cargaron en el archivo de salida son >> ', cont);
	
	cerrar(arch_agos);
	cerrar(arch_feb);
	cerrar(arch_sal);
Fin_Acción.


=================================================================================================


Acción 2117 ES;
Ambiente
	Fecha = Registro
		dd: 1..31;
		mm: 1..12;
		aaaa: N(4);
	Fin_Registro

	Aspirantes = Registro
		DNI: N(8);
		AyN: AN(30);
		Car: ('isi', 'iq', 'iem', 'lar');
		F_N: Fecha;
		email: AN(30);
		col_sec: AN(30);
		F_I: Fecha;
		Aprobado: ('s', 'n');
	Fin_Registro
	
	Seguimiento = Registro
		DNI: N(8);
		AyN: AN(30);
		email: AN(30);
		col_sec: AN(30);
	Fin_Registro
	
	arch_feb: archivo de Aspirantes ordenado por DNI;
	reg_feb: Aspirantes;
	
	arch_agos: archivo de Aspirantes ordenado por DNI;
	reg_agos: Aspirantes;
	
	arch_sal: archivo de Seguimiento ordenado por DNI;
	reg_sal: Seguimiento;
	
	cont: entero;
	
	Procedimiento leer_arch_feb ES;
	Proceso
		leer(arch_feb, reg_feb);
		
		si FDA(arch_feb) entonces
			reg_feb.DNI:= HV;
		fin_si
	Fin_Procedimiento
	
	Procedimiento leer_arch_agos ES;
	Proceso
		leer(arch_agos, reg_agos);
		
		si FDA(arch_agos) entonces
			reg_agos.DNI:= HV;
		fin_si
	Fin_Procedimiento

Proceso
	abrir e/(arch_feb);
	leer_arch_feb;
	
	abrir e/(arch_agos);
	leer_arch_agos;
	
	abrir /s(arch_sal);
	
	cont:= 0; 
	
	mientras (reg_feb.DNI <> HV) o (reg_agos.DNI <> HV) hacer
		
		si (reg_feb.DNI < reg_agos.DNI) entonces
			leer_arch_feb;
		sino
			si (reg_feb.DNI > reg_agos.DNI) entonces
				leer_arch_agos;
			sino
				//Si llega acá, es porque se encontró a la misma persona en los dos archivos
				//Pregunto en el archivo de Febrero, porque si está acá, evidentemente desaprobó en Agosto
				si (reg_feb.aprobado = 'n') entonces
					reg_sal.DNI:= reg_agos.DNI;
					reg_sal.AyN:= reg_agos.AyN;
					reg_sal.email:= reg_agos.email;
					reg_sal.col_sec:= reg_agos.col_sec;
					esc(arch_sal, reg_sal);
					
					cont:= cont + 1;
				fin_si
				
				leer_arch_feb;
				leer_arch_agos;
			fin_si
		fin_si
		
	fin_mientras
	
	
	cerrar(arch_feb);
	cerrar(arch_agos);
	cerrar(arch_sal);
	
Fin_Acción.




































