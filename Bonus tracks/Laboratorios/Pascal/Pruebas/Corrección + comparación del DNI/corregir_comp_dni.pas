

program c_dni;
uses crt;
var
	dni: string;
	error_count: integer;
	
	sec: text;
	v: char;
	acuml_dni: string;

Begin
	
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

	assign(sec, 'entrada.txt');
	reset(sec);
	read(sec, v);	
	
	acuml_dni:= '';
	while not eof(sec) do
	begin
		acuml_dni:= acuml_dni + v;
		read(sec, v);
	
	end;


	if (acuml_dni = dni) then
	begin
		writeln('Los números coinciden.');
	end
	else
		begin
			writeln('Los números no conciden.');
		end;

	close(sec);
End.





