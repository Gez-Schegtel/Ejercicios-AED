

Program enteros;
uses crt;
type
	sec_entrada = file of integer;
	
	sec_salida1 = file of integer;
	
	sec_salida2 = file of integer;
	
var
	sec_ent: sec_entrada;
	ent: integer;
	
	sec_sal1: sec_salida1;
	sal1: integer;
	
	sec_sal2: sec_salida2;
	sal2: integer;
	
	
	resE: integer;
	
	acuml1: integer;
	acuml2: integer;
	
	//************************************************************//
	procedure menu;
	begin
		clrscr;
		writeln('Esto no pide el ejercicio. Pero no me importa ni mierda.');
		write('El archivo de salida se llamará ');
		TextColor(lightblue);
		writeln('"ent.dat"');
		TextColor(lightgray);
		write('Para guardar un número, se debe ingresar el valor del mismo y luego presionar ');
		TextColor(lightmagenta + blink);
		writeln('ENTER ');
		TextColor(lightgray);
		writeln('para que impacte en el archivo.');
		TextColor(lightgray);
		write('Para salir ingrese '); 
		TextColor(lightred + blink);
		writeln('-1', #13#10); //#13#10 hace un salto de línea adicional.
		TextColor(lightgray);
		writeln('Si ingresás 2, 5, 8, 11, 14, 17, 15, 10, 11, 20, 44, 12, 14, 16');
		TextColor(magenta);
		writeln('Te devuelve primero 2, 5, 8, 11, 14, 17, 10, 11, 20, 44 ');
		TextColor(cyan);
		writeln('y después 15, 12, 14, 16.', #13#10);
			
	end;

	Procedure fin_hermoso;
	begin
		TextColor(LightGray);write(#13#10, 'Saliendo ');
		delay(80);TextColor(LightBlue);write(' >');delay(80);write('>');delay(80);write('>');delay(80);write('>');delay(80);
		delay(80);TextColor(LightGreen);write(' >');delay(80);write('>');delay(80);write('>');delay(80);write('<');delay(80);
		delay(80);TextColor(LightMagenta);write(' >');delay(80);write('>');delay(80);write('<');delay(80);write('<');delay(80);
		delay(80);TextColor(Cyan);write(' >');delay(80);write('<');delay(80);write('<');delay(80);write('<');delay(80);
		delay(80);TextColor(White);write(' <');delay(80);write('<');delay(80);write('<');delay(80);write('<');delay(200);
		
	end;
	//*************************************************************//

Begin
	//**************************//
	menu;
	
	assign(sec_ent, 'ent.dat');
	rewrite(sec_ent);
	
	repeat
		TextColor(lightgreen);
		write('>> ');
		TextColor(lightgray);
		read(ent);
		
		if (ent <> -1) then
		begin
			write(sec_ent, ent);
		end
		else			
			fin_hermoso;
	
	until (ent = -1);
	
	close(sec_ent);
	//**************************//
	
	assign(sec_ent, 'ent.dat');
	reset(sec_ent);
	read(sec_ent, ent);
	
	assign(sec_sal1, 'sal1.dat');
	rewrite(sec_sal1);
	
	assign(sec_sal2, 'sal2.dat');
	rewrite(sec_sal2);
	
	acuml1:= 0;
	acuml2:= 0;
	
	while not eof(sec_ent) do
	begin
		repeat
			write(sec_sal1, ent);
			resE:= ent;
			acuml1:= acuml1 + ent;
			read(sec_ent, ent);
			
		until((ent < resE) or eof(sec_ent));
		
		if not eof(sec_ent) then
		begin
			repeat
				write(sec_sal2, ent);
				resE:= ent;
				acuml2:= acuml2 + ent;
				read(sec_ent, ent);
				
			until((ent < resE) or eof(sec_ent));
			
			if eof(sec_ent) then
			begin
				write(sec_sal2, ent);
			end;
		end;
		
	end;
	
	if (acuml1 > acuml2) then
	begin
		writeln(#13#10, #13#10, 'La primer secuencia es mayor.', #13#10);
	end
	else
		if (acuml1 = acuml2) then
		begin
			writeln(#13#10, #13#10, 'Las dos secuencias tienen en el mismo valor.', #13#10);
		end
		else
			writeln(#13#10, #13#10, 'La secuencia dos es la de mayor valor.', #13#10);
			
	close(sec_ent);
	close(sec_sal1);
	close(sec_sal2);
	
	//***************************//
	assign(sec_ent, 'ent.dat');
	reset(sec_ent);
	
	while not eof(sec_ent) do
	begin
		read(sec_ent, ent);
		TextColor(yellow);
		write(' | ', ent);
	end;
	
	writeln(' | ', #13#10);
	close(sec_ent);
	//***************************//
	
	//***************************//
	assign(sec_sal1, 'sal1.dat');
	reset(sec_sal1);
	
	while not eof(sec_sal1) do
	begin
		read(sec_sal1, sal1);
		TextColor(lightred);
		write(' | ', sal1);
	end;
	
	writeln(' | ', #13#10);
	close(sec_sal1);
	//***************************//

	//***************************//
	assign(sec_sal2, 'sal2.dat');
	reset(sec_sal2);
	
	while not eof(sec_sal2) do
	begin
		read(sec_sal2, sal2);
		TextColor(lightblue);
		write(' | ', sal2);
	end;
	
	writeln(' | ', #13#10);
	close(sec_sal2);
	//***************************//
	
End.






