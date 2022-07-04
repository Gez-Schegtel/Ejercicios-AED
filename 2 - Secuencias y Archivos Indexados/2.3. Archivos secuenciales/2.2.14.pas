

Dados el siguiente fichero con datos de un censo de la ciudad de Resistencia:

CENSO Ordenado por Radio, Manzana, Nro_Vivienda

    Radio Manzana Nro_Vivienda Condicion_Vivienda Cantidad_Habitantes 

Condición puede ser : Muy Buena, Buena o Mala. Obtener los siguientes totales de personas que habitan en viviendas cuya condición es muy buena: total en la ciudad y totales por Radio y Manzana).


Acción 2214 ES;
Ambiente 
	censo = registro
		rad: an(40);
		mzn: an(40);
		num_v: n(8);
		cond_v: ('mb', 'b', 'm'); 
		habi: n(8);
	fin_registro
	
	arch_c: archivo de censo ordenado por rad, mzn, num_v;
	reg_c: censo;
	
	res_rad: an(40);
	res_mzn: an(40);
	
	cont_rad: entero;
	cont_mzn: entero;
	contot: entero;
	
	procedimiento corte_manzana ES;
		esc('Los habitantes que están en el radio ', res_rad, ' en la manzana ', res_mzn, ' en condiciones muy buenas son >> ', cont_mzn);
		
		cont_rad:= cont_mzn + cont_rad;
		cont_mzn:= 0;
		
		res_mzn:= reg_c.mzn;
	fin_procedimiento
	
	procedimiento corte_radio ES;
		corte_manzana;
	
		esc('Los habitantes que están en el radio ', res_rad, ' en condiciones muy buenas son >> ', cont_rad);
	
		contot:= contot + cont_rad;
		cont_rad:= 0;
		
		res_rad:= reg_c.rad;
	fin_procedimiento
	
Proceso
	abrir E/(arch_c);
	leer(arch_c, reg_c);
	
	res_rad:= reg_c.rad;
	res_mzn:= reg_c.mzn;
	
	cont_rad:= 0;
	cont_mzn:= 0;
	contot:= 0;
	
	mientras NFDA(arch_c) hacer
		
		si (res_rad <> reg_c.rad) entonces
			corte_radio;
		sino
			si (res_mzn <> reg_c.rad) entonces
				corte_manzana;
			fin_si
		fin_si
		
		si (reg_c.cond_v = 'mb') entonces
			cont_mzn:= cont_mzn + 1;
		fin_si
		
		leer(arch_c, reg_c);
	fin_mientras
	
	corte_radio;
	
	esc('El total de personas que viven en viviendas en condiciones muy buenas son >> ', contot);
	
	cerrar(arch_c);
Fin_Acción.








