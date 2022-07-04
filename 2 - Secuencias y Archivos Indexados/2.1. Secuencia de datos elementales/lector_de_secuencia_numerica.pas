
program lector_de_secuencia_de_nums;
uses crt;
type
	sec_nums = file of integer;

var
	sec: sec_nums;
	v: integer;

	procedure menu;
	begin
		write('Este programa puede leer la secuencia de enteros que se encuentra en el archivo ');
		TextColor(lightblue);
		writeln('"salida125.dat"', #13#10);
	end;

Begin
	menu;
	assign(sec, 'salida125.dat');
	reset(sec);

	while not eof(sec) do
	begin
		read(sec, v);
		TextColor(lightgray);
		write(' | ', v);
	end;

	writeln(' | ', #13#10);
	close(sec);
End.
