


Un Casino de la región ha notado un incremento en los costos de las reparaciones de tragamonedas en sus sucursales. Por ello solicitó un informe con la cantidad de reparaciones y sus costos, discriminados según tragamonedas, modelo, marca, sucursal y total general.

Se dispone de un archivo REPARACIONES, con el siguiente formato. Cada registro representa la reparación de un tragamonedas, tener en cuenta que puede existir más de una reparación por tragamonedas.

REPARACIONES Ordenado por Cod_Sucursal, Marca, Modelo, Cod_Tragamonedas

    Cod_Sucursal Marca Modelo Cod_Tragamonedas Fecha_Reparacion Costo_Reparacion 

Realice el algoritmo para emitir el informe con los totales solicitados



Acción 2213 ES;
Ambiente
	fecha = registro
		aaaa: n(8);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	reparaciones = registro
		cod_s: n(8);
		marca: an(30);
		model: an(30);
		cod_t: n(8);
		f_rep: fecha;
		c_rep: n(6);
	fin_registro
	
	arch_r: archivo de reparaciones ordenado por cod_s, marca, model, cod_t;
	reg_r: reparaciones;
	
	res_cod_s: n(8);
	res_marca: an(30);
	res_model: an(30);
	res_cod_t: n(8);
	
	// contadores de costos
	cont_tragamonedas: entero;
	cont_modelo: entero;
	cont_marca: entero;
	cont_cod_s: entero;
	contot: entero;
	
	// contadores de reparaciones
	cont_repair_tragamonedas: entero;
	cont_repair_modelo: entero;
	cont_repair_marca: entero;
	cont_repair_s: entero;
	contot_repair: entero;
	
	
	procedimiento corte_tragamonedas ES;
		
		esc('Para la sucursal ', res_cod_s, ' el costo de reparaciones del tragamonedas ', res_marca, res_model, ' código ', res_cod_t, ' es de >> ', cont_tragamonedas);
		esc('Para la sucursal ', res_cod_s, ' la cantidad de reparaciones del tragamonedas ', res_marca, res_model, ' código ', res_cod_t, ' es de >> ', cont_repair_tragamonedas);
		
		cont_modelo:= cont_modelo + cont_tragamonedas;
		cont_tragamonedas:= 0;
		
		cont_repair_modelo:= cont_repair_modelo + cont_repair_tragamonedas;
		cont_repair_tragamonedas:= 0;
		
		res_cod_t:= reg_r.cod_t;
		
	fin_procedimiento;

	procedimiento corte_modelo ES;
		
		corte_tragamonedas;
		
		esc('Para la sucursal ', res_cod_s, ' el costo de reparaciones del tragamonedas ', res_marca, res_model, ' es de >> ', cont_modelo);
		esc('Para la sucursal ', res_cod_s, ' la cantidad de reparaciones del tragamonedas ', res_marca, res_model, ' es de >> ', cont_repair_modelo);
	
		cont_marca:= cont_marca + cont_modelo;
		cont_modelo:= 0;
		
		cont_repair_marca:= cont_repair_marca + cont_repair_modelo;
		cont_repair_modelo:= 0;
		
		res_model:= reg_r.model;
		
	fin_procedimiento;
	
	procedimiento corte_marca ES;
		 
		corte_modelo;

		esc('Para la sucursal ', res_cod_s, ' el costo de reparaciones del tragamonedas ', res_marca, ' es de >> ', cont_marca);
		esc('Para la sucursal ', res_cod_s, ' la cantidad de reparaciones del tragamonedas ', res_marca, ' es de >> ', cont_repair_marca);
		
		cont_cod_s:= cont_cod_s + cont_marca;
		cont_marca:= 0;
		
		cont_repair_s:= cont_repair_s + cont_repair_marca;
		cont_repair_marca:= 0;
		
		res_marca:= reg_r.marca;
		 
	fin_procedimiento
	
	procedimiento corte_sucursal ES;
		
		corte_marca;
		
		esc('Para la sucursal ', res_cod_s, ' el costo de reparaciones de las reparaciones es de >> ', cont_cod_s);
		esc('Para la sucursal ', res_cod_s, ' la cantidad de reparaciones del tragamonedas es de >> ', cont_repair_s);
		
		contot:= contot + cont_cod_s;
		cont_cod_s:= 0;
		
		contot_repair:= contot_repair + cont_repair_s;
		cont_repair_s:= 0;
		
		res_cod_s:= reg_r.cod_s;
		
	fin_procedimiento

Proceso
	abrir E/(arch_r);
	leer(arch_r, reg_r);

	res_cod_s:= reg_r.cod_s;
	res_marca:= reg_r.marca;
	res_model:= reg_r.model;
	res_cod_t:= reg_r.cod_t;

	// contadores de costos
	cont_tragamonedas:= 0;
	cont_modelo:= 0;
	cont_marca:= 0;
	cont_cod_s:= 0;
	contot:= 0;
	
	// contadores de reparaciones
	cont_repair_tragamonedas:= 0;
	cont_repair_modelo:= 0;
	cont_repair_marca:= 0;
	cont_repair_s:= 0;
	contot_repair:= 0;
	
	mientras NFDA(arch_r) hacer
		
		// esquema de corte
		si (res_cod_s <> reg_r.cod_s) entonces
			corte_sucursal;
		sino
			si (res_marca <> reg_r.marca) entonces
				corte_marca;
			sino 
				si (res_model <> reg_r.model) entonces
					corte_modelo;
				sino
					si (res_cod_t <> reg_r.cod_t) entonces
						corte_tragamonedas;
					fin_si
				fin_si
			fin_si
		fin_si
		
		// lo que nos pide el enunciado
		cont_repair_tragamonedas:= cont_repair_tragamonedas + 1;
		cont_tragamonedas:= cont_tragamonedas + reg_r.c_rep;
		
		leer(arch_r, reg_r);
	fin_mientras
	
	corte_sucursal;
	
	esc('El costo total de las reparaciones es de >> ', contot);
	esc('El número total de reparaciones es de >> ', contot_repair)

	cerrar(arch_r);
Fin_Acción.























