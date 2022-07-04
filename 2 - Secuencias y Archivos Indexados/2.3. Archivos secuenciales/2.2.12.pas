


Dada una secuencia con información de población de un PAIS:

POBLACION Ordenado por Provincia, Departamento, Ciudad, Barrio, ID_Casa

    Provincia Departamento Ciudad Barrio ID_Casa Cantidad_Habitantes 

Generar una secuencia con información de los departamentos de esa provincia, cuyo registro tenga el siguiente formato:

POBLACION_SALIDA

    Provincia Departamento Cantidad_Habitantes 


Acción 2212 ES;
Ambiente
	pob1 = registro
		pcia: an(40);
		dpto: an(40);
		cdad: an(40);
		barr: an(40);
		id_c: n(8);
		habi: n(8);
	fin_registro
	
	arch_p1: archivo de pob1 ordenado por pcia, dpto, cdad, barr, id_c;
	reg_p1: pob1;
	
	pob2 = registro
		pcia: an(40);
		dpto: an(40);
		habi: n(8);
	fin_registro
	
	arch_s: archivo de pob2;
	reg_s: pob2;
	
	res_pcia: an(40);
	res_dpto: an(40);

	cont_habi: entero;
	
	procedimiento corte_departamento ES;
		reg_s.pcia:= res_pcia;
		reg_s.dpto:= res_dpto;
		reg_s.habi:= cont_habi;
		esc(arch_s, reg_s);
		
		cont_habi:= 0;
		
		res_dpto:= reg_p1.dpto;
	fin_procedimiento
	
	procedimiento corte_provincia ES;
	
	procedimiento corte_provincia ES;
		corte_departamento;
		
		res_pcia:= reg_p1.pcia;
	fin_procedimiento
	
Proceso
	abrir E/(arch_p1);
	leer(arch_p1, reg_p1);
	
	abrir /s(arch_s);
	
	res_pcia:= reg_p1.pcia;
	res_dpto:= reg_p1.dpto;
	
	cont_habi:= 0;
	
	mientras NFDA(arch_p1) hacer
		si (res_pcia <> reg_p1.pcia) entonces
			corte_provincia;
		sino
			si (res_dpto <> reg_p1.dpto) entonces
				corte_departamento;
			fin_si
		fin_si
		
		cont_habi:= cont_habi + reg_p1.habi;
	
		leer(arch_p1, reg_p1);
	fin_mientras 
	
	corte_provincia;
	
	cerrar(arch_p1);
	cerrar(arch_s);
Fin_Acción.














