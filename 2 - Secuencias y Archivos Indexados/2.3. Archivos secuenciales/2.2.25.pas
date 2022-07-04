

Acción 2225 ES;
Ambiente
	fecha = registro 
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	clave = registro 
		cod_usuario: n(4);
		cod_amigo: n(4);
	fin_registro
	
	amigo = registro 
		clave_amigo: clave;
		fecha_amistad: fecha;
		msj_muro: an(255);
	fin_registro 
	
	notificación = registro 
		clave_notificación: clave;
		cod_mov: ('A', 'B', 'M');
		fecha_amistad: fecha;
		msj_muro: an(255);
	fin_registro
	
	mae: archivo de amigo ordenado por clave_amigo;
	rmae: amigo;
	
	maeA: archivo de amigo ordenado por clave_amigo;
	rmaeA: amigo;
	
	move: archivo de notificación ordenado por clave_notificación;
	rmov: notificación;
	
	procedimiento leer_mae ES;
	proceso
		leer(mae, rmae);
		
		si FDA(mae) entonces
			rmae.clave_amigo:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento leer_mov ES;
	proceso
		leer(move, rmov);
		
		si FDA(move) entonces
			rmov.clave_notificación:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento master_men_move ES;
	proceso
		//no hay movimientos para el master, se copia entonces como está 
		rmaeA:= rmae;
		esc(maeA, rmaeA);
		
		leer_mae;
	fin_procedimiento
	
	procedimiento master_may_move ES;
	proceso
		si (rmov.cod_mov = 'A') entonces
			rmaeA.clave_amigo:= rmov.clave_notificación;
			rmaeA.fecha_amistad:= rmov.fecha_amistad;
			rmaeA.msj_muro:= rmov.msj_muro;
			
			esc(maeA, rmaeA);
		sino 
			si (rmov.cod_move = 'B') entonces 
				esc('Error, no se puede dar de baja a una persona que no está en la lista de amigos.');
			sino 
				esc('Error, no se puede modificar el mensaje de una persona que no está en la lista de amigos.');
			fin_si
		fin_si
		
		leer_mov;
	fin_procedimiento
	
	procedimiento master_eq_move ES;
	proceso
		si (rmov.cod_move = 'A') entonces 
			esc('Error, no se puede agregar una personas que ya está en lista de amigos.');
			rmaeA:= rmae;
			
			esc(maeA, rmaeA);
		sino
			si (rmov.cod_move = 'B') entonces
				esc('Amigo eliminado con éxito.');
			sino
				rmaeA:= rmae;
				rmaeA.msj_muro:= rmov.msj_muro;
				
				esc(maeA, rmaeA);
			fin_si
		fin_si
		
		leer_mae;
		leer_mov;
	fin_procedimiento
	
Proceso
	abrir e/(mae);
	leer_mae;
	
	abrir e/(move);
	leer_mov;
	
	abrir /s(maeA);
		
	mientras (rmae.clave_amigo <> HV) o (rmov.clave_notificación <> HV) hacer 
		
		si (rmae.clave_amigo < rmov.clave_notificación) entonces
			master_men_move;
		sino
			si (rmae.clave_amigo > rmov.clave_notificación) entonces
				master_may_move;
			sino
				master_eq_move;
			fin_si
		fin_si
		
	fin_mientras
	
	cerrar(mae);
	cerrar(maeA);
	cerrar(move);
Fin_Acción.








































