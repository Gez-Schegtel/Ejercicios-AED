

program lector_de_secuencia;
uses crt;
var
	sec: text;
	v: char;
	
	procedure menu;
	begin
		clrscr;
		write('Este programa puede leer la secuencia de texto que se encuentra en el archivo ');
		TextColor(lightblue);
		writeln('"text_sec.txt"', #13#10);
	end;

Begin
	menu;
	
	assign(sec, 'text_sec.txt');
	reset(sec);
	
	while not eof(sec) do
	begin
		read(sec, v);
		TextColor(lightgray);
		write(v);
	end;
	
	writeln(#13#10);
	close(sec);
End.







