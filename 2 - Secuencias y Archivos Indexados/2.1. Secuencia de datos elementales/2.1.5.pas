
{
La secuencia de socios del problema anterior tiene el inconveniente de que los números están ordenados pero no son correlativos. Se desea generar una secuencia que contenga los números de socios que no figuran en la secuencia de socios.

ejemplo de entrada:	|2|5|6|7|9|FDS
ejemplo de salida:	|3|4|8|FDS


Acción 215 ES;
Ambiente
	sec: secuencia de Entero;
	v: Entero;
	
	sally: secuencia de Entero;
	
	res: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	res:= v;
	avz(sec, v);
	
	crear(sally);
	
	Mientras NFDS(sec) hacer
	
		si ((v - res) <> 1) entonces
			
			res:= res + 1;
			
			repetir 
				write(sally, res);
				res:= res + 1;
			hasta_que (v = res);
		
		fin_si
		
		res:= v;
		avz(sec, v);
		
	Fin_Mientras
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.
}

program something;
type
	sec_num = file of integer;
var
	sec: sec_num;
	v: integer;

	sally: sec_num;
	
	res: integer;
	
Begin
	assign(sec, 'num_sec.dat');
	reset(sec);
	read(sec, v);
	res:= v;
	read(sec, v);
	
	assign(sally, 'salida5.dat');
	rewrite(sally);
	
	while not eof(sec) do
	begin

		if ((v - res) <> 1) then
		begin
			res:= res + 1;
			repeat 
				write(sally, res);
				res:= res + 1;
			until (v = res);
		end;
		
		res:= v;
		read(sec, v);
	end;
	
	close(sec);
	close(sally);
End.





















