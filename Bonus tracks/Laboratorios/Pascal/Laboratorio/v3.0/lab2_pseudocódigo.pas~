

Aerolíneas Argentinas cuenta con una secuencia con datos de sus viajes en el año 2020, y requiere que usted y su equipo le ayuden con un sistema.

La secuencia tiene datos de todos los pasajes vendidos y cuenta con: código de vuelo (6 caracteres), código del avión (8 caracteres), fecha (dd/mm/aaaa), distancia recorrida en kilómetros (4 dígitos), origen y destino (caracteres encerrados entre "-") y DNI del pasajero (8 dígitos, sin puntos).
Los datos de cada viaje finalizan en un signo "+".

Por ejemplo: 

XXU4351234HJK920/11/20170030-Cordoba-Mendoza-12001321+MMM2222WE34RFD10/12/20170012-Buenos Aires-Misiones-30265874+*

Se solicita que realice un programa en Pascal que:
	
	1- Generar una secuencia de salida con todos los destinos (separados por un #) de los pasajes vendidos en un mes que el usuario solicite.
	
	2- Calcular el promedio de distancia recorrida sobre la cantidad de pasajes vendidos.
	
	3- Contar la cantidad de pasajes comprados por un DNI ingresado por el usuario.




Acción lab ES;
uses crt, math;
Ambiente
	sec: secuencia de caracter; 
	v: caracter; 
	
	sally: secuencia de caracter;
	
	//Variable que contiene el mes ingresado por el usuario
	mes_usuario: alfanumérico;
	
	//Variable que contiene el mes ingresado por el usuario
	dni_usuario: alfanumérico;
	
	//Variable que controla los cíclos de los mensajes de error en el ingreso de datos
	error_count: entero;
	
	acuml_mes: alfanumérico;
	acuml_convert: entero;
	acuml_km_viajes: entero;
	acuml_dni: alfanumérico;
	
	cont_pas_xdni: entero;
	cont_pastot: entero;
	
	mes_convert: alfanumérico;
	
	i: entero;
	option: caracter;

	procedimiento present ES;
	proceso
			
			//Arte en ASCII generado en el sitio web " https://es.rakko.tools/tools/68/ ", utilizando la imagen que se encuentra a continuación...
			// https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.tztemuRaDOj-_ZH1Ho8ZCAHaHa%26pid%3DApi&f=1
			
			clrscr;
			delay(30); textcolor(magenta); 		esc('	   -----:     :-----     :----- 	');          
			delay(30); textcolor(blue); 		esc('	   #####+     *####*     +#####         ');  
			delay(30); textcolor(white); 		esc('	   +#####.    *####*    .#####*         ');  
			delay(30); textcolor(lightblue);	esc('	   :#####*    *####*    +#####-         ');  
			delay(30); textcolor(green);		esc('	    +#####*.  *####*  .*#####*          ');  
			delay(30); textcolor(cyan);		esc('	    .*######+:*####*:+######*.          ');  
			delay(30); textcolor(red);		esc('	     .*####################*.           ');  
			delay(30); textcolor(lightcyan);	esc('	       -##################=             ');  
			delay(30); textcolor(lightgray); 	esc('		       .=*############*=.              ');  
			delay(30); textcolor(lightgreen);	esc('	   ::::::::-+*######*+-::::::::         ');  
			delay(30); textcolor(brown);		esc('	  .############################.        ');  
			delay(30); textcolor(white);		esc('	   ############################.        ');  
			delay(30); textcolor(yellow);		esc('	   ############################.        ');  
			delay(30); textcolor(magenta);		esc('	   =========+*######*+=========         ');  
			delay(30); textcolor(red); 		esc('		        :=*###########=:               ');  
			delay(30); textcolor(cyan); 		esc('	       .+################+:             ');
			delay(30); textcolor(green); 		esc('	      =####################=            ');  
			delay(30); textcolor(lightmagenta);	esc('	     +#######=*####*=#######+           ');  
			delay(30); textcolor(blue);		esc('	    =######-  *####*  -######=          ');  
			delay(30); textcolor(red);		esc('	   .######.   *####*   .*#####:         ');  
			delay(30); textcolor(lightblue);	esc('	   +#####:    *####*    :#####+         ');  
			delay(30); textcolor(lightgreen);	esc('	   #####*     *####*     +#####         ');  
			delay(30); textcolor(magenta);		esc('	   +++++-     =++++=     -+++++         ');                                                    
			delay(800); clrscr;
			textcolor(lightgray);
	
	fin_procedimiento;


	procedimiento crear_sally ES;
	proceso
		{
		Nuestra idea es que el usuario tenga la posibilidad de analizar la cantidad de meses que necesite
		y para ello es importante que la secuencia de salida que se genere contenga toda esa información.
		
		Para ello, vamos a generar la secuencia "sally" haciendo uso de la función "append", y para hacer esto
		es necesario primero crearla de manera convencional y luego cerrarla. Así, el archivo impacta vacío en 
		el sistema y queda a disposición para cuando se lo necesite.
		
		Esta ventaja de poder sobreescribir el archivo está presente mientras el programa esté en ejecución. 
		Si se ejecuta nuevamente el programa, se elimina el contenido creado en alguna ejecución anterior, 
		si es que lo hay.
		}
		
		assign(sally, 'salida.txt');
		{$I-}
		crear(sally);
		{$I+}
		
		si (IOresult <> 0) entonces
			esc('No se pudo crear el archivo.');
		fin_si;
		
		cerrar(sally);
	
	fin_procedimiento;
	
	procedimiento iniciar_secuencias ES;
	proceso
		//Se abre la secuencia de entrada y se posiciona en el primer elemento
		assign(sec, 'entrada.txt');
		{$I-}
		arr(sec);
		{$I+}
		
		si (IOresult <> 0) entonces
			esc('No se pudo abrir el archivo...');
			textcolor(red);
			esc(' Posiblemente no está creado.', #13#10); //#13#10 proporciona un salto de línea adicional
			halt;
		fin_si;
	
		avz(sec, v);
		
		{
		Abro la salida en modo "append", lo que permite que se pueda sobreescribir sobre ella
		y así poder analizar varios meses sin perder la información que ya se había almacenado 
		}
		
		append(sally);
		esc(sally, ' Mes: ', mes_usuario, ' ==> # ');
	fin_procedimiento;
	
	{
	Con este procedimiento se corrige si el usuario ingresa una variable menor a los dos dígitos
	sin causar problemas en la ejecución del programa
	}
	
	procedimiento corregir_mes ES;
	proceso	
		según (mes_usuario) hacer
			'1': mes_usuario:= '01';
			'2': mes_usuario:= '02';
			'3': mes_usuario:= '03';
			'4': mes_usuario:= '04';
			'5': mes_usuario:= '05';
			'6': mes_usuario:= '06';
			'7': mes_usuario:= '07';
			'8': mes_usuario:= '08';
			'9': mes_usuario:= '09';
		fin_según;
	fin_procedimiento;
	
	procedimiento ingresar_mes ES;
	proceso
		//Este ciclo sirve para verificar que se ingrese un dato que no sobrepase los dos dígitos
		error_count:= 0;
		
		repetir
			si (error_count = 0) entonces

				esc('Por favor, ingrese el mes que desee evaluar. ');
				esc(' >> ');
				leer(mes_usuario);
				corregir_mes;
			sino
		
				{
				Si ingresa a esta parte, es porque se suministró un dato erróneo la primera vez
				y se repetirá hasta que se proporcione el correcto
				}
				textcolor(lightred);
				esc('Ingresó un dato erróneo. Por favor, no ingrese más de ');
				textcolor(lightcyan);
				esc('2');
				textcolor(lightred);
				esc(' dígitos.');
				textcolor(lightgray);
				esc(' >> ');
				leer(mes_usuario);
				corregir_mes;
			fin_si
			
			error_count:= error_count + 1;
		{
		'length' es una función de Pascal que devuelve la longitud de un string
		con la segunda parte de la condición, se verifica que no se ingrese 0 como mes
		con la tercera se corrige si se ingresa como mes algo mayor a 12
		}
		hasta ((length(mes_usuario) <= 2) y (mes_usuario <> '0') y (mes_usuario <= '12')); 	
	
	fin_procedimiento;

	procedimiento ingresar_dni ES;
	proceso
		error_count:= 0;
		repetir
			si (error_count = 0) entonces
	
				esc('Por favor, ingrese el número de DNI que desee evaluar. ');
				esc(' >> ');
				leer(dni_usuario);
			sino
			
				//Ídem a lo anterior
				textcolor(lightred);
				esc('Ha ingresado un número incorrecto. Por favor, ingrese un número de ');
				textcolor(lightcyan);
				esc('8');
				textcolor(lightred);
				esc(' dígitos sin puntos entre sí.');
				textcolor(lightgray);
				esc(' >> ');
				leer(dni_usuario);
			fin_si;
			
			error_count:= error_count + 1;
		
		//Ídem al procedimiento anterior, pero se controla que se ingrese siempre un dato de 8 dígitos
		hasta (length(dni_usuario) = 8);
	
	fin_procedimiento;

	procedimiento mensajes_finales ES;
	proceso
		esc(#13#10, 'La secuencia de salida se generó correctamente según el mes ');
		textcolor(lightcyan);
		
		//Este condicional múltiple sirve para poder escribir el nombre del mes por pantalla
		según (mes_usuario) hacer 
			'01': mes_convert:= 'Enero';
			'02': mes_convert:= 'Febrero';
			'03': mes_convert:= 'Marzo';
			'04': mes_convert:= 'Abril';
			'05': mes_convert:= 'Mayo';
			'06': mes_convert:= 'Junio';
			'07': mes_convert:= 'Julio';
			'08': mes_convert:= 'Agosto';
			'09': mes_convert:= 'Septiembre';
			'10': mes_convert:= 'Octubre';
			'11': mes_convert:= 'Noviembre';
			'12': mes_convert:= 'Diciembre';
		fin_según;
		
		esc(mes_usuario, ' (', mes_convert,')');
		textcolor(lightgray);
		esc('. La puede visualizar en la carpeta donde está alojado el programa, bajo el nombre ');
		textcolor(lightmagenta);
		esc(' "salida.txt"');
		textcolor(lightgray);
		
		esc('El promedio de distancia recorrida de los pasajes que se han comercializado es de ');
		textcolor(lightgreen);
		esc((acuml_km_viajes/cont_pastot):0:2, 'km');
		
		textcolor(lightgray);
		esc('La cantidad de pasajes que coinciden con el DNI ');
		textcolor(lightcyan);
		esc(dni_usuario);
		textcolor(lightgray);
		esc(' son ');
		textcolor(lightgreen);
		esc(cont_pas_xdni, #13#10); 
		
		textcolor(lightgray);
		esc('Presione cualquier tecla para salir o ');
		textcolor(yellow);
		esc('ENTER');
		textcolor(lightgray);
		esc(' para evaluar más datos.', #13#10);
		
		option:= readkey; //Lo que se presione, se guarda aquí
	
	fin_procedimiento;
		
Proceso
	crear_sally;
	present;
	
	repetir
		ingresar_mes;
		ingresar_dni;
		iniciar_secuencias;
		
		acuml_km_viajes:= 0;
		cont_pas_xdni:= 0;
		cont_pastot:= 0;
		
		mientras (v <> '*') hacer 
		
			mientras (v <> '+') hacer 
			
				//Todo lo anterior al primer "/" no lo necesito. Lo avanzo
				mientras (v <> '/') hacer 
				
					avz(sec, v);
				
				fin_mientras;
				avz(sec, v);
				
				//Acumulo el mes para realizar luego la comparación con lo ingresado por el usuario.
				acuml_mes:= v;
				avz(sec, v);
				acuml_mes:= acuml_mes + v;
				
				//Avanzo hasta la distancia recorrida
				para i:= 1 hasta 6 hacer 
				
					avz(sec, v);
				
				fin_para;
				
				//Convertimos a un número entero los km viajados, para poder operar y hallar el promedio
				acuml_convert:= 0;
				para i:= 3 hasta 0, -1 hacer
				
					según (v) hacer
						'0': acuml_convert:= acuml_convert + 0 * 10**i; 
						'1': acuml_convert:= acuml_convert + 1 * 10**i;
						'2': acuml_convert:= acuml_convert + 2 * 10**i;
						'3': acuml_convert:= acuml_convert + 3 * 10**i;
						'4': acuml_convert:= acuml_convert + 4 * 10**i;
						'5': acuml_convert:= acuml_convert + 5 * 10**i;
						'6': acuml_convert:= acuml_convert + 6 * 10**i;
						'7': acuml_convert:= acuml_convert + 7 * 10**i;
						'8': acuml_convert:= acuml_convert + 8 * 10**i;
						'9': acuml_convert:= acuml_convert + 9 * 10**i;
					fin_según;
					
					avz(sec, v);
				fin_para;
				avz(sec, v);
				
				//Acumulamos el total de kilómetros realizados
				acuml_km_viajes:= acuml_km_viajes + acuml_convert;
				
				//Avanzamos el origen
				mientras (v <> '-') hacer 
			
					avz(sec, v); 
				
				fin_mientras;
				avz(sec, v);
				
				//Escribimos en la salida, si cumple la condición. Si no, avanza.
				si (mes_usuario = acuml_mes) entonces
				
					mientras (v <> '-') hacer
					
						esc(sally, v);
						avz(sec, v);
					
					fin_mientras;
					esc(sally, ' # ');
				
				sino
					
					mientras (v <> '-') hacer 
					
						avz(sec, v);
					
					fin_mientras;
				fin_si;
				
				//Nos paramos en el primer dígito del DNI, y los acumulamos para comparar.
				avz(sec, v);
				
				//En Pascal se tienen que inicializar estas variables del tipo string, para usarlas como un acumulador
				acuml_dni:= '';
				para i:= 1 hasta 8 hacer 
				
					acuml_dni:= acuml_dni + v;
					avz(sec, v); 
				
				fin_para;
				
				si (dni_usuario = acuml_dni) entonces
				
					cont_pas_xdni:= cont_pas_xdni + 1;
				
				fin_si;
				
			fin_mientras;
			
			//Cuento el total general de pasajes que hay en la secuencia
			cont_pastot:= cont_pastot + 1;
			avz(sec, v);
			
		fin_mientras;
		
		mensajes_finales;
	
	//#13 es lo que se almacena en la variable option si se presiona la tecla ENTER en el teclado
	hasta (option <> #13);
	
	cerrar(sec);
	cerrar(sally);

Fin_Acción.











