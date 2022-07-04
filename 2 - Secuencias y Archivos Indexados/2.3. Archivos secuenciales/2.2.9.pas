
Una casa deportiva dispone de un archivo de productos, ordenado por código de producto, que contiene los siguientes datos:

PRODUCTOS Ordenado por Cod_Producto

Cod_Producto Tipo (1,2,3) Marca Modelo Descripción Cantidad_Existente Precio_Unitario
Se ha registrado en el mercado un aumento de precios, el cual no es uniforme para todos los artículos, sino que varía según el tipo de los mismos de la siguiente manera: tipo 1- Calzados: 10%, tipo 2 – Indumentaria: 25%, tipo 3 - Accesorios (pelotas, raquetas, etc.): 50%. Por este motivo el gerente de la empresa solicitó al Departamento de Informática que modifique los precios de acuerdo a los porcentajes antes mencionados.
Generar un nuevo fichero de productos para cumplir con la solicitud del gerente.
Al terminar el proceso informar cantidad total de artículos de cada tipo hay y total general.


Acción 229 ES;
Ambiente
	producto = registro 
		cpr: n(4);
		tip: (1, 2, 3);
		mar: an(30); 
		mode: an(30); 
		des: an(100); 
		cae: n(3);
		pru: n(5);
	fin_registro
	
	arch_p: archivo de producto ordenado por cpr;
	reg_p: producto;
	
	sally: archivo de producto ordenado por cpr;
	reg_s: producto;
	
	cont1: entero;
	cont2: entero;
	cont3: entero;
	
Proceso
	abrir E/(arch_p);
	leer(arch_p, reg_p);

	cont1: entero;
	cont2: entero;
	cont3: entero;

	Mientras NFDA(arch_p) hacer 
		según (reg_p.tip) hacer
			1: reg_s.pru:= reg_p.pru * 1.1; cont1:= cont1 + 1;
			2: reg_s.pru:= reg_p.pru * 1.25; cont2:= cont2 + 1;
			3: reg_s.pru:= reg_p.pru * 1.5; cont3:= cont3 + 1;
		fin_según
		
		reg_s.cpr:= reg_p.cpr;
		reg_s.tip:= reg_p.tip;
		reg_s.mar:= reg_p.mar;
		reg_s.mode:= reg_p.mode;
		reg_s.des:= reg_p.des;
		reg_s.cae:= reg_p.cae;
		esc(sally, reg_s);
		
		leer(arch_p, reg_p);
	Fin_Mientras
	
	esc('Número de artículos tipo 1 >> ', cont1);
	esc('Número de artículos tipo 2 >> ', cont2);
	esc('Número de artículos tipo 3 >> ', cont3);
	esc('Total de artículos >> ', cont1+cont2+cont3);
	
	cerrar(arch_p);
	cerrar(sally);
Fin_Acción.

====================================================
====================================================

Versión 2

Acción 229 ES;
Ambiente
	producto = registro 
		cpr: n(4);
		tip: (1, 2, 3);
		mar: an(30); 
		mode: an(30); 
		des: an(100); 
		cae: n(3);
		pru: n(5);
	fin_registro
	
	arch_p: archivo de producto ordenado por cpr;
	reg_p: producto;
	
	sally: archivo de producto ordenado por cpr;
	reg_s: producto;
	
	cont1: entero;
	cont2: entero;
	cont3: entero;
	
Proceso
	abrir E/(arch_p);
	leer(arch_p, reg_p);

	cont1: entero;
	cont2: entero;
	cont3: entero;

	Mientras NFDA(arch_p) hacer 
		según (reg_p.tip) hacer
			1: 	reg_s:= reg_p;
				reg_s.pru:= reg_p.pru * 1.1; 
				cont1:= cont1 + 1;
			
			2: 	reg_s:= reg_p;
				reg_s.pru:= reg_p.pru * 1.25; 
				cont2:= cont2 + 1;
			
			3: 	reg_s:= reg_p;
				reg_s.pru:= reg_p.pru * 1.5; 
				cont3:= cont3 + 1;
		fin_según

		esc(sally, reg_s);
		leer(arch_p, reg_p);
	Fin_Mientras
	
	esc('Número de artículos tipo 1 >> ', cont1);
	esc('Número de artículos tipo 2 >> ', cont2);
	esc('Número de artículos tipo 3 >> ', cont3);
	esc('Total de artículos >> ', cont1+cont2+cont3);
	
	cerrar(arch_p);
	cerrar(sally);
Fin_Acción.





