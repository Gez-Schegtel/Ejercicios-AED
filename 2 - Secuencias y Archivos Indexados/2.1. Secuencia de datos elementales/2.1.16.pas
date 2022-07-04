
{
Se dispone de una secuencia de números de DNI asignados a un circuito electoral, generar otra secuencia de números que contenga los DNI múltiplos de 3.

	21654987|33654987|12478852|FDS

Acción 2116 ES;
Ambiente
	sec: secuencia de entero;
	v: entero;
	
	sally: secuencia de entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sally);
	
	Mientras NFDS(sec) hacer
		
		si (v mod 3 = 0) entonces
			esc(sally, v);
		fin_si	
		
		avz(sec, v);
		
	Fin_Mientras
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.
}

program something;
type
	secuencia_de_entero = file of integer;
var 
	sec: secuencia_de_entero;
	v: integer;
	
	sally: secuencia_de_entero;

Begin
	assign(sec, 'num_sec.dat');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida16.dat');
	rewrite(sally);
	
	while not eof(sec) do 
	begin
		if (v mod 3 = 0) then
		begin
			write(sally, v);
		end;
		
		read(sec, v);
	end;
	
	close(sec);
	close(sally);
End.

































