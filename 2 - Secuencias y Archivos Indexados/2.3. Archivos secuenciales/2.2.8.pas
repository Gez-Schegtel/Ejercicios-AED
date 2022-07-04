
De los datos del siguiente ejercicio:

COMPRAS Ordenado por Nro_Cliente

Nro_Cliente Fecha_Ultima_Compra Monto
CLIENTES Ordenado por Nro_Cliente

Nro_Cliente Apellido_Nombre Domicilio Teléfono DNI
Ambos archivos están ordenados por Nro. de Cliente en forma ascendente. Listar los nombres fecha y monto de última compra, de todos aquellos clientes cuya última compra sea posterior a una fecha dada y el monto supere un monto dado.

Acción 228 ES;
Ambiente 
	Fecha = registro
		dd: 1..31;
		mm: 1..12;
		aaaa: n(4);
	fin_registro

	compra = registro
		ncl: n(2);
		fuc: Fecha;
		mon: n(4);
	fin_registro
	
	arch_cm: archivo de compra ordenado por ncl;
	reg_cm: compra;
	
	cliente = registro 
		ncl: n(4);
		ayn: an(30);
		dom: an(45);
		tel: n(10); 
		dni: n(8);
	fin_registro
	
	arch_cl: archivo de cliente ordenado por ncl;
	reg_cl: cliente;
	
	user_fech: Fecha;
	user_price: n(4);

Proceso
	abrir E/(arch_cm);
	leer(arch_cm, reg_cm);

	abrir E/(arch_cl);
	leer(arch_cl, reg_cl);
		
	esc('Ingrese la fecha que desee evaluar.');
	esc('día >> ');
	leer(user_fech.dd);
	esc('mes >> ');
	leer(user_fech.mm);
	esc('año >> ');
	leer(user_fech.aaaa);
	
	esc('Ingrese el monto que desee evaluar.');
	leer(user_price)
	
	esc('Nombre | Fecha de la última compra | monto de la última compra');
	
	Mientras NFDA(arch_cm) y NFDA(arch_cl) hacer
		si (reg_cl.ncl = reg_cm.ncl) entonces
			si (reg_cm.fuc > user_fech) y (reg_cm.mon > user_price) entonces
				esc(reg_cl.ayn);
				esc(reg_cm.fuc);
				esc(reg.cm.mon);
			fin_si
			leer(arch_cl, reg_cl);
			leer(arch_cm, reg_cm);
		sino
			si (reg_cl.ncl < reg_cm.ncl) entonces
				leer(arch_cl, reg_cl);
			sino
				leer(arch_cm, reg_cm);
			fin_si
		fin_si
		
	Fin_Mientras

	cerrar(arch_cm);
	cerrar(arch_cl);
Fin_Acción.








