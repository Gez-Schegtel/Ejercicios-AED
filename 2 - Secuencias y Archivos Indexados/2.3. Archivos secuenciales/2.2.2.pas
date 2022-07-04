
Se dispone de una secuencia de facturas con los siguientes datos:

Nº de Factura
Fecha
Total

Se desea un listado de las facturas cuyas fechas sean posteriores a una fecha dada, y cuyos importes totales no alcancen los $1000, con el siguiente formato:

Nro_Factura Fecha Importe_Total

Acción 222 ES;
Ambiente
	fecha = registro
		dd: 1..31;
		mm: 1..12;
		aaaa: n(4);
	fin_registro
	
	facturas = registro
		num_fact: n(4);
		fech_fact: fecha;
		tot_fact: n(4);
	fin_registro
	
	arch_fact: archivo de facturas;
	reg_fact: facturas;
	
	user_fech: fecha; 
	
Proceso
	abrir e/(arch_fact);
	leer(arch_fact, reg_fact);
	
	esc('Por favor, ingrese la fecha sobre la que desee hacer la evaluación.');
	esc('día >> '); 
	leer(user_fech.dd);
	esc('mes >> '); 
	leer(user_fech.mm);
	esc('año >> '):
	leer(user_fech.aaaa);
	
	esc('Número Factura | Fecha | Importe Total');
	
	Mientras NFDA(arch_fact) hacer
		si (reg_fact.fech_fact > user_fech) y (reg_fact.tot_fact > 1000) entonces
			esc(reg_fact.num_fact);
			esc(reg_fact.fech_fact.dd);
			esc(reg_fact.fech_fact.mm);
			esc(reg_fact.fech_fact.aaaa);
			esc(reg_fact.tot_fact);
		fin_si		
		
		leer(arch_fact, reg_fact);
	Fin_Mientras
	
	cerrar(arch_fact);
Fin_Acción.















