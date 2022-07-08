


{
Aerolíneas Argentinas cuenta con una secuencia con datos de sus viajes en el año 2020, y requiere que usted y su equipo le ayuden con un sistema.

La secuencia tiene datos de todos los pasajes vendidos y cuenta con: código de vuelo (6 caracteres), código del avión (8 caracteres), fecha (dd/mm/aaaa), distancia recorrida en kilómetros (4 dígitos), origen y destino (caracteres encerrados entre "-") y DNI del pasajero (8 dígitos, sin puntos).
Los datos de cada viaje finalizan en un signo "+".

Por ejemplo: 

XXU4351234HJK920/11/20170030-Cordoba-Mendoza-12001321+MMM2222WE34RFD10/12/20170012-Buenos Aires-Misiones-30265874+*

Se solicita que realice un programa en Pascal que:

	1- Generar una secuencia de salida con todos los destinos (separados por un #) de los pasajes vendidos en un mes que el usuario solicite.
	
	2- Calcular el promedio de distancia recorrida sobre la cantidad de pasajes vendidos.
	
	3- Contar la cantidad de pasajes comprados por un DNI ingresado por el usuario.
}


program lab; 
uses crt;
var 
	sec: text;
	v: char; 
	sally: text;
	op_menu: integer;
	op_io: char;
	i: integer;
	
	//No lo pongo como string[2], porque de la forma que se desarrolla a continuación, se logran mejores resultados	
	//Variables que se utilizan en la función "gen_sal_dado_mes"
	mes_usuario: string; 
	error_count: integer;
	acuml_mes: string;
	
	//Variables que se utilizan en el procedimiento "calc_prom_dist"
	viajes_tot: integer; 
	convert: integer;
	km_tot: integer; 
	p: integer;
	prom: real; 

	//Variables que se utilizan en el procedimiento "cant_por_dni"
	dni: string;
	acuml_dni: string;
	contpas: integer;
	
	
	procedure iniciar_sec;
	begin
		assign(sec, 'entrada.txt');
		{$I-}				
		reset(sec);				
		{$I+}

	  	if IOResult <> 0 then	  			  			
		begin
			textcolor(red);
			writeln('No se pudo abrir el archivo... ERROR');	  	
			textcolor(lightgray);
		end;
		
		if (op_menu = 1) then
		begin
			assign(sally, 'salida.txt');
			rewrite(sally);
		end;
	end;
	
	
	//Con este procedimiento se corrige si el usuario ingresa una variable menor a los dos dígitos
	procedure corregir_mes;
	begin
		case (mes_usuario) of
			'1': mes_usuario:= '01';
			'2': mes_usuario:= '02';
			'3': mes_usuario:= '03';
			'4': mes_usuario:= '04';
			'5': mes_usuario:= '05';
			'6': mes_usuario:= '06';
			'7': mes_usuario:= '07';
			'8': mes_usuario:= '08';
			'9': mes_usuario:= '09';
		end;
	end;
	
	procedure ingresar_mes;
	begin
		//Este ciclo sirve para verificar que se ingrese un dato que no sobrepase los dos dígitos
		error_count:= 0;
		repeat
			if (error_count = 0) then
			begin
				write('Por favor, ingrese el mes que desee evaluar >> ');
				readln(mes_usuario);
				corregir_mes;
			end
			else
				begin
					textcolor(lightred);
					writeln('Ingresó un dato erróneo. Por favor, ingrese el mes que desee evaluar, utilizando dos dígitos.');
					textcolor(lightgray);
					readln(mes_usuario);
					corregir_mes;
				end;
			
			error_count:= error_count + 1;
		
		//'length' es una función de Pascal que devuelve la longitud de un string
		//con la segunda parte de la condición, se verifica que no se ingrese 0 como mes
		//con la tercera se corrige si como mes algo mayor a 12
		until ((length(mes_usuario) <= 2) and (mes_usuario <> '0') and (mes_usuario <= '12')); 	
	end;
	
	procedure gen_sal_dado_mes;
	begin
		ingresar_mes;
		
		while (v <> '*') do 
		begin
			
			while (v <> '/') do 
			begin
				read(sec, v);
			end;
			read(sec, v);
			
			acuml_mes:= '';
			acuml_mes:= v;
			read(sec, v);
			acuml_mes:= acuml_mes + v;
			
			for i:= 1 to 2 do 
			begin
				while (v <> '-') do 
				begin
					read(sec, v);
				end;
				read(sec, v);
			end;
			
			if (mes_usuario = acuml_mes) then
			begin
				while (v <> '-') do 
				begin
					write(sally, v);
					read(sec, v);
				end;
				write(sally, '#');
				
			end;

			while (v <> '+') do 
			begin
				read(sec, v);
			end;
			read(sec, v);
		end;
	
	end;

	procedure calc_prom_dist;
	begin
		viajes_tot:= 0;
		km_tot:= 0;

		while (v <> '*') do 
		begin
			viajes_tot:= viajes_tot + 1;
			for i:= 1 to 2 do 
			begin
				while (v <> '/') do 
				begin
					read(sec, v);
				end;
				read(sec, v);
			end;
			
			for i:= 1 to 4 do 
			begin
				read(sec, v);
			end;
			
			p:= 1000;
			convert:= 0;
			for i:= 1 to 4 do
			begin
				case (v) of
					'0': convert:=  convert + (0*p);
					'1': convert:=  convert + (1*p);
					'2': convert:=  convert + (2*p);
					'3': convert:=  convert + (3*p);
					'4': convert:=  convert + (4*p);
					'5': convert:=  convert + (5*p);
					'6': convert:=  convert + (6*p);
					'7': convert:=  convert + (7*p);
					'8': convert:=  convert + (8*p);
					'9': convert:=  convert + (9*p);
				end;
				
				p:= p div 10;
				read(sec, v);
			end;
			km_tot:= km_tot + convert;
			
			while (v <> '+') do 
			begin
				read(sec, v);
			end;
			read(sec, v);
					
		end;

		prom:= km_tot/viajes_tot;
		writeln('El promedio de la distancias recorridas por la cantidad de viajes que se realizaron es igual a >> ', prom:3:2);
	
	end;

	procedure cant_por_dni;
	begin
		error_count:= 0;
		repeat
			if (error_count = 0) then
			begin
				writeln('Por favor, ingrese un número de DNI.');
				readln(dni);
			end
			else
				begin
					textcolor(lightred);
					writeln('Ha ingresado un número incorrecto. Por favor, ingrese un número de 8 dígitos, sin puntos entre sí.');
					textcolor(lightgray);
					readln(dni);
				end;
			
			error_count:= error_count + 1;
		
		until (length(dni) = 8);
		
		
		acuml_dni:= '';
		contpas:= 0;

		while (v <> '*') do
		begin
			for i:= 1 to 3 do
			begin
				while v <> '-' do 
				begin
					read(sec, v);
				end;
				read(sec, v);
			end;	
		
			for i:= 1 to 8 do
			begin
				acuml_dni:= acuml_dni + v;
				read(sec, v);
			end;	


			if (acuml_dni = DNI) then
			begin
				contpas:= contpas + 1
			end;

			acuml_dni:= '';
			
		read(sec, v);
		end;	

		writeln('La cantidad de pasajes por el número de DNI ingresado es >> ', contpas);
	
	end;
	

Begin

	repeat
		writeln('Por favor, seleccione la opción que desee realizar: ');
		writeln('1- Generar una secuencia con que contenga los destinos que usted solicite.');
		writeln('2- Calcular el promedio de distancia recorrida sobre la cantidad de pasajes vendidos.');
		writeln('3- Contar la cantidad de pasajes comprados por un DNI que usted solicite.');
		readln(op_menu);
		
		if (op_menu = 1) then 
		begin
			iniciar_sec;
			gen_sal_dado_mes;
			close(sally);
		end
		else
			if (op_menu = 2) then
			begin
				iniciar_sec;
				calc_prom_dist;		
			end
			else
				if (op_menu = 3) then 
				begin
					iniciar_sec;
					cant_por_dni;	
				end
				else
					begin
						writeln('La opción ingresada es incorrecta.');
					end;
					
		writeln('¿Desea repetir la operación?');
		readln(op_io);
	
	until(upcase(op_io) = 'N');
	
	close(sec);
End.

{
XXU4351234HJK920/11/20170030-Cordoba-Mendoza-12001321+MMM2222WE34RFD10/12/20170012-Buenos Aires-Misiones-30265874+*
}



















