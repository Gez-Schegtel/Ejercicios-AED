
{
Dada una secuencia de caracteres, determinar la cantidad de palabras de 4 caracteres (letras)

Acción 2111 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	cont: entero;
	contot: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	contot:= 0;
	
	Mientras NFDS(sec) hacer
			
		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras	
		
		cont:= 0;		
		mientras (v <> ' ') y NFDS(sec) hacer
			cont:= cont + 1; 
			avz(sec, v);
		fin_mientras
	
		si (cont = 4) entonces
			contot:= contot + 1;
		fin_si
		
		avz(sec, v);
		
	Fin_Mientras
	
	esc('Las palabras que tienen 4 letras en la secuencia son >> ', contot);
	cerrar(sec);
Fin_Acción.
}

program something;
var
	sec: text;
	v: char;
	
	cont: integer;
	contot: integer;
	
Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	contot:= 0;
	
	while not eof(sec) do
	begin
		while (v = ' ') do
		begin
			read(sec, v);
		end;
		
		cont:= 0;
		while (v <> ' ') and not eof(sec) do 
		begin
			cont:= cont + 1; 
			read(sec, v);
		end;
		
		if (cont = 4) then
		begin
			contot:= contot + 1;
		end;
		
		read(sec, v);
	end;
	
	writeln('Las palabras que tienen 4 letras en la secuencia son >> ', contot);
	close(sec);
End.









