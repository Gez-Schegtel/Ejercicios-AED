

program c_dni;
uses crt;
var
	dni_usuario: string;
	error_count: integer;
	op: char;

Begin
	repeat
		error_count:= 0;
		repeat
			if (error_count = 0) then
			begin
				writeln('Por favor, ingrese un número de DNI.');
				readln(dni_usuario);
			end
			else
				begin
					textcolor(lightred);
					writeln('Ha ingresado un número incorrecto. Por favor, ingrese un número de 8 dígitos, sin puntos entre sí.');
					textcolor(lightgray);
					readln(dni_usuario);
				end;
			
			error_count:= error_count + 1;
		
		until (length(dni_usuario) = 8);
	
		writeln('¿Realizar la prueba de nuevo? s/n');
		readln(op);
		
	until (upcase(op) = 'N')
End.















