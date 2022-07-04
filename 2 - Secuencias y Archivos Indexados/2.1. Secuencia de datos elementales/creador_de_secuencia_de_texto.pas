

program creador_de_secuencia; //Crea secuencias de texto
uses crt;
var
	sec: text;
	v: char;
	
	procedure menu;
	begin
		clrscr;
		writeln('Este programa crea una secuencia de texto.');
		write('El archivo de salida se llamará ');
		TextColor(lightblue);
		writeln('"text_sec.txt"');
		TextColor(lightgray);
		write('Para salir presione '); 
		TextColor(lightred + blink);
		writeln('ESC', #13#10); //#13#10 hace un salto de línea adicional.
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
	
	assign(sec, 'text_sec.txt');
	rewrite(sec);
	
	repeat
		v:= ReadKey;
		
		if (v <> #27) then
		begin
			TextColor(lightgray);
			write(sec, v); // Esto va guardando lo que escribo
			write(v); // y acá se muestra lo que escribo
		end
		else
			fin_hermoso;
			
	until (v = #27);
	
	close(sec);
End.
