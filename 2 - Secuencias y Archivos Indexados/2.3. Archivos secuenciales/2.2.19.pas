
En una Empresa Farmacéutica se posee un archivo MAE_REMEDIOS (ordenado por Clave: Farmacia + Medicamento), el que se actualiza semanalmente, a traves de la información que se encuentra cargada en un archivo de MOVIMIENTOS (ordenado por Clavem: Farmacia + Medicamento, y Cod_Mov), de la siguiente forma:

    Si Clave (MAE_REMEDIOS) es menor que Clavem (MOVIMIENTOS), simplemente se transfieren los datos del Maestro a la salida y se graban.

    Si Clave (MAE_REMEDIOS) es igual a Clavem (MOVIMIENTOS) y el Codmov es 1, se considera error y se lista un mensaje indicando el tipo de error; pero si el Codmov es 2, entonces es un remedio que deja de fabricarse y se transfiere el registro al archivo de Remedios vencidos (REM_VENC) ; pero si el Cod_Mov es 3, se modifica la cantidad actual con la cantidad recibida.

    Si Clave (MAE_REMEDIOS) es mayor que Clavem (MOVIMIENTOS) y el Codmov es 1, se incorpora el remedio a nuestro Vademecum, considerando que la cantidad recibida configura la cantidad actual y la Fecha_Vencimiento es 30 días posterior a la fecha actual; pero si el Codmov es 2 o 3 se considera error y se deben producir los correspondientes mensajes de error.

Se considera que solo existe un registro de movimiento para cada registro del maestro.

MAE_REMEDIOS Ordenado por Farmacia y Medicamento

    Farmacia Medicamento Cant_Actual Fecha_Vencimiento

MOVIMIENTOS Ordenado por Farmacia, Medicamento y Cod_Mov

    Farmacia Medicamento Cod_Mov Cant_Recibida

REM_VENC Ordenado por Medicamento

    Medicamento Cant_Vencida


Acción 2219 ES;
Ambiente
	fecha = registro 
		aaaa: n(4);
		mm: 1..12;
		dd: 1..31;
	fin_registro
	
	clave = registro 
		farmacia: an(40);
		medicamento: an(40);
	fin_registro
	
	remedio = registro 
		claveR: clave;
		cant_actual: n(4);
		fecha_venc: fecha;
	fin_registro 
	
	movimiento = registro 
		claveM: clave;
		cod_mov: ('1', '2', '3'); //ALTA BAJA MODIFICACIÓN
		cant_recibida: n(4);
	fin_registro
	
	vencimiento = registro 
		medicamento: an(40);
		cant_venc: n(4);
	fin_registro
	
	archMAE: archivo de remedio ordenado por claveR;
	regMAE: remedio;
	
	archMAE_ACT: archivo de remedio ordenado por claveR;
	regMAE_ACT: remedio;	
	
	archMOV: archivo de movimiento ordenado por claveR;
	regMOV: movimiento;
	
	archVENC: archivo de vencimiento ordenado por medicamento; 
	regVENC: vencimiento; 
	
	
	procedimiento leer_MAE ES;
	proceso
		leer(archMAE, regMAE);
		
		si FDA(archMAE) entonces
			regMAE.clave:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento leer_MOV ES;
	proceso
		leer(archMOV, regMOV);
		
		si FDA(archMOV) entonces
			regMOV.clave:= HV;
		fin_si
	fin_procedimiento
	
	procedimiento MAEmenMOV ES; //El maestro no tiene movimientos acá
	proceso
		regMAE_ACT:= regMAE;
		esc(archMAE_ACT, regMAE_ACT);
		
		leer_MAE;
	fin_procedimiento
	
	procedimiento MAEmayMOV ES;
	proceso
		si (regMOV.cod_mov = '1') entonces //ALTA
			regMAE_ACT.claveR:= regMOV.claveM;
			regMAE_ACT.cant_actual:= regMOV.cant_recibida;
			regMAE_ACT.fecha_venc:= sistema.FechaActual + 30; //fechaActual es una función que podemos usar	
			
			esc(archMAE_ACT, regMAE_ACT);
		sino
			si (regMOV.cod_mov = '2') entonces //BAJA
				esc('No se puede dar de baja un producto que no existe en el archivo.');
			sino
				si (regMOV.cod_mov = '3') entonces //MODIFICACIÓN
					esc('No se puede modificar un producto que no existe en el archivo.');
				fin_si
			fin_si
		fin_si	
		
		leer_MOV;
	fin_procedimiento
	
	procedimiento MAEeqMOV ES;
	proceso
		si (regMOV.cod_mov = '1') entonces //ALTA
			esc('No se puede dar de alta un producto que ya existe en el archivo.');
			regMAE_ACT:= regMAE;
			
			esc(archMAE_ACT, regMAE_ACT);
		sino
			si (regMOV.cod_mov = '2') entonces //BAJA
				regVENC.medicamento:= regMAE.clave.medicamento;
				regVENC.cant_venc:= regMAE.cant_actual;
				
				esc(archVENC, regVENC);
			sino
				si (regMOV.cod_mov = '3') entonces //MODIFICACIÓN
					regMAE_ACT:= regMAE;
					regMAE_ACT.cant_actual:= regMAE_ACT.cant_actual + regMOV.cant_recibida;
					
					esc(archMAE_ACT, regMAE_ACT);
				fin_si
			fin_si
		fin_si	
		
		leer_MAE;
		leer_MOV;
	fin_procedimiento
	
Proceso
	abrir e/(archMAE);
	leer_MAE;
	
	abrir e/(archMOV);
	leer_MOV;
	
	abrir /s(archMAE_ACT);
	
	abrir /s(archVENC);


	mientras (regMAE.claveR <> HV) o (regMOV.claveM <> HV) hacer
		
		si (regMAE.claveR < regMOV.claveM) entonces
			MAEmenMOV;
		sino
			si (regMAE.claveR > regMOV.claveM) entonces
				MAEmayMOV;
			sino	
				MAEeqMOV;
			fin_si
		fin_si
		
	fin_mientras
	
	cerrar(archMAE);
	cerrar(archMAE_ACT);
	cerrar(archMOV);
	cerrar(archVENC);
Fin_Acción.















