
Acción 2224 ES;
Ambiente
	fecha = registro 
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	costo_por_afiliado = registro
		cod_afl: n(4);
		f_alta: fecha;
		f_baja: fecha;
		cant_s: n(2);
		costo: n(4);
	fin_registro
	
	servicios_semanales = registro
		cod_afl: n(4);
		f_at: fecha;
		cod_s: n(4);
		costo: n(4);
	fin_registro
	
	mae: archivo de costo_por_afiliado ordenado por cod_afl;
	rmae: costo_por_afiliado;
		
	maeA: archivo de costo_por_afiliado ordenado por cod_afl;
	rmaeA: costo_por_afiliado;
	
	mov: archivo de servicio_semanales ordenado por cod_afl;
	rmov: servicios_semanales;
	
	procedimiento leer_mae ES;
	proceso
		leer(mae, rmae);
		
		si FDA(mae) entonces
			rmae.cod_afl:= HV;
		fin_si
	fin_proceso
	
	procedimiento leer_mov ES;
	proceso
		leer(mov, rmov);
		
		si FDA(mov) entonces
			rmov.cod_afl:= HV;
		fin_si
	fin_procedimiento

	procedimiento mae_men_mov ES;
	proceso
		//Maestro sin movimientos, lo copio como está al archivos de salida actualizado
		rmaeA:= rmae;
		esc(maeA, rmaeA);
		leer_mae;
	fin_procedimiento
	
	procedimiento mae_may_mov ES;
	proceso
		//Doy de alta, si cumple la condición
		si (rmov.cod_s = 001) entonces
			rmaeA.cod_afl:= rmov.cod_afl;
			rmaeA.f_alta:= rmov.f_at;
			rmaeA.f_baja:= ''; //No sé qué copiar aquí
			rmaeA.cant_s:= 1;
			rmaeA.costo:= rmov.costo;
			
			leer_mov;
			//Ahora controlo si tuvo más movimientos
			mientras (rmae.cod_afl = rmov.cod_afl) hacer
				rmaeA.cant_s:= rmaeA.cant_s + 1;
				rmaeA.costo:= rmaeA.costo + rmov.costo;
				
				leer_mov;
			fin_mientras	
			
			esc(maeA, rmaeA);
		sino
			esc('Error, no se puede dar de alta el cliente porque no se proporcionó el código de servicio correspondiente');
			
			leer_mov;
			
			//Este ciclo está por si se repite el mismo cliente
			mientras (rmae.cod_afl = rmov.cod_afl) hacer
				leer_mov;
			fin_mientras
		fin_si
	fin_procedimiento
	
	procedimiento mae_eq_mov ES;
	proceso
		rmaeA:= rmae;
		
		mientras (rmae.cod_afl = rmov.cod_afl) hacer
			
			si (rmov.cod_s = 000) entonces
				rmaeA.f_baja:= rmov.f_at; //baja lógica
				//Acá supongo que si se da de baja, no va a volver a aparecer este 
				//cliente en el archivo de movimiento.
			sino
				rmaeA.cant_s:= rmaeA.cant_s + 1;
				rmaeA.costo:= rmaeA.costo + rmov.costo;
			fin_si
			
			leer_mov;
		
		fin_mientras
		
		esc(maeA, regA);
		leer_mae;
	fin_procedimiento
	
Proceso
	abrir e/(mae);
	leer_mae;
	
	abrir e/(mov);
	leer_mov;
	e
	abrir /s(maeA);
	
	mientras (rmae.cod_afl <> HV) o (rmov.cod_afl <> HV) hacer
	
		si (rmae.cod_afl < rmov.cod_afl) entonces
			mae_men_mov;
		sino
			si (rmae.cod_afl > rmov.cod_afl) entonces
				mae_may_mov;
			sino
				mae_eq_mov;
			fin_si
		fin_si
		
	fin_mientras

	cerrar(mae);
	cerrar(mov);
	cerrar(maeA);
Fin_Acción.










