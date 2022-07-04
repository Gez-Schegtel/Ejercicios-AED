

Acción 2223 ES;
Ambiente
	fecha = registro 
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	cliente = registro 
		id_casa: n(4);
		f_ult_lec: fecha;
		cant_lec: n(2);
		prom_lec: n(2);
		tipo_consum: ('A', 'B', 'C'); 
	fin_registro
	
	medición = registro 
		id_casa: n(4);
		f_medi: fecha;
		consum: n(4);
	fin_registro
	
	clientes: archivo de cliente ordenado por id_casa;
	reg_cl: cliente;
	
	clientesA: archivo de cliente ordenado por id_casa;
	reg_clA: cliente;
	
	mediciones: archivo de medición ordenado por id_casa;
	reg_med: medición;
	
	procedimiento leer_master ES;
	proceso
		leer(clientes, reg_cl);
		
		si FDA(clientes) entonces
			reg_cl.id_casa:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento leer_move ES;
	proceso
		leer(mediciones, reg_med);
		
		si FDA(mediciones) entonces
			reg_cl.id_casa:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento master_men_move ES;
	proceso
		//El maestro no tiene movimientos
		reg_clA:= reg_cl;
		esc(clientesA, reg_clA);
		leer_master;
	fin_procedimiento
	
	procedimiento master_may_move ES;
	proceso		
		// Doy de alta y después me fijo si tuvo más movimientos
		reg_clA.id_casa:= reg_med.id_casa;
		reg_clA.f_ult_lec:= reg_med.f_medi;
		reg_clA.cant_lec:= 1;
		reg_clA.prom_lec:= reg_med.consum;
		
		leer_move;
		
		mientras (reg_cl.id_casa = reg_med.id_casa) hacer
			//Me pide actualizar hasta enero del 2015
			si (reg_med.f_medi.aaaa < 2015) o ((reg_med.f_medi.aaaa = 2015) y (reg_med.f_medi.mm = 1)) entonces 
				reg_clA.f_ult_lec:= reg_med.f_medi;
				reg_clA.cant_lec:= reg_clA.cant_lec + 1;
				reg_clA.prom_lec:= ((reg_clA.prom_lec * reg_clA.cant_lec) + reg_med.consum)/reg_clA.cant_lec;      	
			fin_si
			
			leer_move;
		fin_mientras
		
		según (reg_clA.prom_lec) hacer
			<20000: reg_clA.tipo_consum:= 'A';
			<40000: reg_clA.tipo_consum:= 'B';
			>=40000: reg_clA.tipo_consum:= 'C';
		fin_según
		
		esc(clientesA, reg_clA);
		
	fin_procedimiento
	
	{
	procedimiento master_may_move ES;
	proceso		
		// Doy de alta (si cumple la condición sobre la fecha de medición) y después me fijo su tuvo más movimientos
		si (reg_med.f_medi.aaaa < 2015) o ((reg_med.f_medi.aaaa = 2015) y (reg_med.f_medi.mm = 1)) entonces 
			reg_clA.id_casa:= reg_med.id_casa;
			reg_clA.f_ult_lec:= reg_med.f_medi;
			reg_clA.cant_lec:= 1;
			reg_clA.prom_lec:= reg_med.consum;
		
			leer_move;
						
			mientras (reg_cl.id_casa = reg_med.id_casa) hacer
				//Me pide actualizar hasta enero del 2015
				si (reg_med.f_medi.aaaa < 2015) o ((reg_med.f_medi.aaaa = 2015) y (reg_med.f_medi.mm = 1)) entonces 
					reg_clA.cant_lec:= reg_clA.cant_lec + 1;
					reg_clA.prom_lec:= ((reg_clA.prom_lec * reg_clA.cant_lec) + reg_med.consum)/reg_clA.cant_lec;      	
					reg_clA.f_ult_lec:= reg_med.f_medi;
				fin_si
				
				leer_move;
			fin_mientras

			según (reg_clA.prom_lec) hacer
				<20000: reg_clA.tipo_consum:= 'A';
				<40000: reg_clA.tipo_consum:= 'B';
				>=40000: reg_clA.tipo_consum:= 'C';
			fin_según
			
			esc(clientesA, reg_clA);
		sino
			leer_move;
			
			mientras (reg_cl.id_casa = reg_med.id_casa) hacer
				leer_move;
			fin_mientras
		fin_si	
		
	fin_procedimiento
	}
	
	procedimiento master_eq_move ES;
	proceso
		reg_clA:= reg_cl;
		
		mientras (reg_cl.id_casa = reg_med.id_casa) hacer
			si (reg_med.f_medi.aaaa < 2015) o ((reg_med.f_medi.aaaa = 2015) y (reg_med.f_medi.mm = 1)) entonces
				reg_clA.f_ult_lec:= reg_med.f_medi;
				reg_clA.cant_lec:= reg_clA.cant_lec + 1;
				reg_clA.prom_lec:= ((reg_clA.prom_lec * reg_clA.cant_lec) + reg_med.consum)/reg_clA.cant_lec;      	
			fin_si
			
			leer_move;
		fin_mientras
		
		según (reg_clA.prom_lec) hacer
			<20000: reg_clA.tipo_consum:= 'A';
			<40000: reg_clA.tipo_consum:= 'B';
			>=40000: reg_clA.tipo_consum:= 'C';
		fin_según
		
		esc(clientesA, reg_clA); 
		leer_master;
	fin_procedimiento
	
Proceso
	abrir e/(clientes);
	leer_master;
	
	abrir e/(mediciones);
	leer_move;
	
	abrir /s(clientesA);
	
	mientras (reg_cl.id_casa <> HV) o (reg_med.id_casa <> HV) entonces
		
		si (reg_cl.id_casa < reg_med.id_casa) entonces
			master_men_move;
		sino
			si (reg_cl.id_casa > reg_med.id_casa) entonces
				master_may_move;
			sino
				master_eq_move;
			fin_si
		fin_Si
		
	fin_mientras
	
	cerrar(clientes);
	cerrar(mediciones);
	cerrar(clientesA);
Fin_Acción.




















