{
Se dispone de una secuencia de números de socios, y se desea saber la cantidad de socios que están registrados.

Acción 214 ES;
Ambiente
	sec: secuencia de Entero;
	v: Entero;
	
	cont: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	cont:= 0;
	
	Mientras NFDS(sec) hacer
		cont:= cont + 1;
		avz(sec, v);
	Fin_Mientras
	
	esc('Hay ', cont, ' socios.');
	cerrar(sec);
Fin_Acción.

|12|32|24|14|FDS

}



program something;
type
	sec_num = file of integer;

var
	sec: sec_num;
	v: integer;
	
	cont: integer;

Begin
	assign(sec, 'num_sec.dat');
	reset(sec);
	read(sec, v);
	
	cont:= 0;
	
	while not eof(sec) do
	begin
		cont:= cont + 1;
		read(sec, v);
	end;
	
	writeln('Hay ', cont, ' socios.');
	close(sec);
End.


