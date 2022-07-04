
Acción 2222 ES;
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
		clave_notif: clave;
		cod_mov: ('A', 'B', 'M');
		fecha_amistad: fecha;
		msj_muro: an(255);
	fin_registro
	
	archmaster: archivo de amigo ordenado por clave;
	regmaster: amigo;
	
	archact: archivo de amigo ordenado por clave; 
	regact: amigo;
	
	archmove: archivo de notificación ordenado por clave; 
	regmove: notificación;
	
	procedimiento leer_master ES;
	proceso
		leer(archmaster; regmaster);
		
		si FDA(archmaster) entonces
			regmaster.clave:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento leer_move ES;
	proceso
		leer(archmove, regmove);
		
		si FDA(regmove) entonces
			regmove.clave:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento master_men_move ES;
	proceso
		//Significa que no hay notificaciones para este usuario, o sea, no tiene movimiento el archivo maestro
		regact:= regmaster;
		esc(archact, regact);
		leer_master;
	fin_procedimiento
	
	procedimiento master_may_move ES;
	proceso
		si (regmove.cod_mov = 'A') entonces
			regact.clave_amigo:= regmove.clave_notif;
			regact.fecha_amistad:= regmove.fecha_amistad;
			regact.msj_muro:= regmove.msj_muro;
			esc(archact, regact);
		sino
			si (regmove.cod_mov = 'B') entonces
				esc('Error, no se puede dar de baja a alguien que no está en la lista de amigos.');
			sino
				esc('Error, no se puede modificar el último mensaje escrito en el muro de alguien que no está en la lista de amigos.');
			fin_si
		fin_si
		
		leer_move;
	fin_procedimiento
	
	procedimiento master_eq_move ES;
	proceso
		si (regmove.cod_mov = 'A') entonces
			esc('Error, no se puede dar de alta a alguien que ya pertenece a su lista de amigos.');
			regact:= regmaster;
			esc(archact, regact);
		sino
			si (regmove.cod_mov = 'B') entonces
				//Simplemente no lo copio, así se borra físicamente el registro en el archivo actualizado
				esc('Amigo eliminado exitosamente.');
			sino
				regact:= regmaster;
				regact.msj_muro:= regmove.msj_muro;
				esc(archact, regact);
			fin_si
		fin_si
		
		leer_master
		leer_move;		
	fin_procedimiento
	
Proceso
	abrir e/(archmaster);
	leer_master;
	
	abrir e/(archmove);
	leer_move;
	
	abrir /s(archact);
	
	mientras (regmaster.clave_amigo <> HV) o (regmove.clave_notificación <> HV) hacer
		
		si (regmaster.clave_amigo < regmove.clave_notificación) entonces
			master_men_move;
		sino
			si (regmaster.clave_amigo > regmove.clave_notificación) entonces
				master_may_move;
			sino
				master_eq_move;
			fin_si
		fin_si
	
	fin_mientras
	
	cerrar(archmaster);
	cerrar(archmove);
	cerrar(archact);
Fin_Acción.












