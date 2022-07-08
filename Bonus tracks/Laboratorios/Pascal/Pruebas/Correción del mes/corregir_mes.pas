
program c_mes;
uses crt;
const 
	//Asigno un valor cualquiera, para hacer el test del algoritmo
	mes_secuencia = '02';
	
var
	//No lo pongo como string[2], porque de la forma que se desarrolla a continuación, se logran mejores resultados	
	mes_usuario: string; 
	error_count: integer;
	op: char;
	
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
	
Begin
	repeat
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
		

		//Esta parte es para comprobar, nada más
		if (mes_usuario >= '01') and (mes_usuario <= '12') then
		begin
			textcolor(lightblue);
			writeln('Si leés esto, es porque el algoritmo funciona.');
		end
		else
			begin
				textcolor(lightred);
				writeln('Si estás leyendo esto, es porque algo salió mal :-/');
			end;
			
		textcolor(lightgray);
		writeln('¿Querés realizar de nuevo la prueba? s/n');
		readln(op);
	//upcase es una función en pascal que te pone un caracter en mayúscula
	until(upcase(op) = 'N');
End. 	














