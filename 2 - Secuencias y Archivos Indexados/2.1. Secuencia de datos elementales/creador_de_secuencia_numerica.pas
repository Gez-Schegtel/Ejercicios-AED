
// Me molesta no poder llamar numérica al archivo, pero bueno. Pascal no me deja.

program creador_de_secuencia_de_nums;
uses crt;
type
	sec_nums = file of integer;

var
	sec: sec_nums;
	v: integer;
	
	procedure menu;
	begin
		clrscr;
		writeln('Este programa crea una secuencia de enteros.');
		write('El archivo de salida se llamará ');
		TextColor(lightblue);
		writeln('"num_sec.dat"');
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
	end;

	Procedure fin_hermoso;
	begin
		TextColor(LightGray);write(#13#10, #13#10, 'Saliendo ');
		delay(50);TextColor(LightBlue);write(' >');delay(50);write('>');delay(50);write('>');delay(50);write('>');delay(50);
		delay(50);TextColor(LightGreen);write(' >');delay(50);write('>');delay(50);write('>');delay(50);write('<');delay(50);
		delay(50);TextColor(LightMagenta);write(' >');delay(50);write('>');delay(50);write('<');delay(50);write('<');delay(50);
		delay(50);TextColor(Cyan);write(' >');delay(50);write('<');delay(50);write('<');delay(50);write('<');delay(50);
		delay(50);TextColor(White);write(' <');delay(50);write('<');delay(50);write('<');delay(50);write('<');delay(80);
		ClrScr;
	end;
	
Begin	
	menu;
	
	assign(sec, 'num_sec.dat');
	rewrite(sec);
	
	repeat
		TextColor(lightgreen);
		write('>> ');
		TextColor(lightgray);
		read(v);
		
		if (v <> -1) then
		begin
			write(sec, v);
		end
		else			
			fin_hermoso;
	
	until (v = -1);
	
	close(sec);
End.





