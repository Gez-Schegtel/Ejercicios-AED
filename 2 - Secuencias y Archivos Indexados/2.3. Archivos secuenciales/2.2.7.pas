
Se dispone de un archivo con los datos de un padrón electoral con la siguiente información:

	Nombre y apellido
	Clase
	DNI
	Dirección
	Nº de Mesa
	Observaciones
	Nº de Circuito
	Partido (0= independiente, 1=‘A’, 2=‘B’, 3=‘C’)

Generar:
a) Una secuencia de salida con nombre y apellido, DNI, y dirección de todas las personas afiliadas al partido “C”.
b) Una secuencia de salida con nombre y apellido, DNI, y dirección de todas las personas no afiliadas a ningún partido y de clase posterior a 1940.


Acción 227 ES;
Ambiente
	pelec = registro
		ayn: an(30);
		clase: n(4);
		dni: n(8);
		dir: an(45);
		n_mes: n(2);
		obse: an(100);
		n_cir: n(2);
		part: ('0', '1', '2', '3');
	fin_registro
	
	arch_pe: archivo de pelec;
	reg_pe: pelec;
	
	sally = registro
		ayn: an(30);
		dni: n(8);
		dir: an(45);
	fin_registro
	
	sally1: archivo de sally;
	rs1: sally;
	
	sally2: archivo de sally;
	rs2: sally;
	
Proceso
	abrir E/(arch_pe);
	leer(arch_pe);
	
	abrir /s(sally1);
	abrir /s(sally2);

	Mientras NFDA(arch_pe) hacer
		si (reg_pe.part = '3') entonces
			rs1.ayn:= reg_pe.ayn;
			rs1.dni:= reg_pe.dni;
			rs1.dir:= reg_pe.dir;
			esc(sally1, rs1);
		sino
			si (reg_pe.part = '0') y (reg_pe.clase > 1940) entonces
				rs2.ayn:= reg_pe.ayn;
				rs2.dni:= reg_pe.dni;
				rs2.dir:= reg_pe.dir;
				esc(sally2, rs2);				
			fin_si
		fin_si
		
		leer(arch_pe, reg_pe);
	Fin_Mientras

	cerrar(arch_pe);
	cerrar(sally1);
	cerrar(sally2);
Fin_Acción.






