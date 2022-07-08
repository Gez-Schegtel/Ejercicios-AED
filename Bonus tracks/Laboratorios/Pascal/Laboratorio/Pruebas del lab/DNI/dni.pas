program Aerolineas;
uses crt;
var
	dni: string;
	sec: text;
	v: char;
	acuml_dni: string;
	contpas: integer;
	i: integer;

	error_count: integer;
	
Begin

	assign(sec, 'entrada.txt');
	{$I-}
	reset(sec);
	{$I+}
	if IOResult <> 0 then
	begin
		writeln('No existe el archivo .txt');
		halt(2);
	end;
	
	read(sec,v);
		
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

	writeln(contpas);

	close(sec);
		
End.
