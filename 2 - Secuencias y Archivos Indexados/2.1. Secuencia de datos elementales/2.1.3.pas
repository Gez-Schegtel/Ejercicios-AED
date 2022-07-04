
{
Se dispone de una secuencia de caracteres y se desea obtener una secuencia de salida que resulte de copiar la secuencia de entrada, descartando el caracter "$".

Acción 213 ES;
Ambiente
	sec: secuencia de Caracter;
	v: Caracter;
	
	sally: secuencia de Caracter;
	
Proceso
	arr(sec);
	leer(sec, v);
	
	crear(sally);
	
	mientras nfds(sec) hacer
	
		si (v <> '$') entonces
			esc(sally, v);
		fin_si
	
		avz(sec, v);
		
	fin_mientras
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.
}

program something;
var
	sec: text;
	v: char;
	
	sally: text;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida3.txt');
	rewrite(sally);
	
	while not eof(sec) do
	begin
		if (v <> '$') then
		begin
			write(sally, v);
		end;
		
		read(sec, v);
	end;
	
	close(sec);
	close(sally);
End.
{
|$|h|$|o|$|l|$|a|FDS
}






