

{
Se dispone de una secuencia de caracteres. Se desea determinar la cantidad de palabras que comienzan con la letra 'I'.


Acciones 219 ES;
Ambiente
	sec: secuencia de caracter; 
	v: caracter;
	
	cont: entero; 
	
Proceso
	arr(sec);
	avz(sec, v);
	
	cont:= 0;
	
	mientras NFDS(sec) hacer
		
		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras	
	
		si (v = 'I') entonces
			cont:= cont + 1;
		fin_si
		
		mientras (v <> ' ') y NFDS(sec) hacer
			avz(sec, v);
		fin_mientras
		
	fin_mientras
	
	esc('Hay ', cont, ' de letras I en la secuencia.');
	cerrar(sec);
Fin_Acción.
}


program something;
var
	sec: text;
	v: char;
	
	cont: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	cont:= 0;
	
	while not eof(sec) do
	begin
		while (v = ' ') do
		begin
			read(sec, v);
		end;
		
		if (v = 'i') then
		begin
			cont:= cont + 1;
		end;
		
		while ((v <> ' ') and (not eof(sec))) do
		begin
			read(sec, v);
		end;
	end;
	
	writeln('Hay ', cont, ' palabras que comienzan con la letra I en la secuencia.');
	
	close(sec);
End.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
