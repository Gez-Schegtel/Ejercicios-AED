
{
Se dispone de una secuencia de caracteres. Se desea permita contar la cantidad de palabras que comienzan con una letra dada.

Acción 2110 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	user_letter: caracter;
	
	cont: entero;

Proceso
	arr(sec);
	avz(sec, v);
	
	esc('Por favor, ingrese la letra con la que comiencen las palabras que quiere contabilizar.');
	leer(user_letter);
	
	cont:= 0;
	
	Mientras NFDS(sec) hacer
	
		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras
		
		si (v = user_letter) entonces
			cont:= cont + 1;
		fin_si
		
		mientras (v <> ' ') y NFDS(sec) hacer
			avz(sec, v);
		fin_mientras
	
	fin_mientras
	
	esc('Hay ', cont, ' letras ', user_letter, ' en la secuencia.');
	
	cerrar(sec);

Fin_Acción.

}



program something;
var
	sec: text;
	v: char;
	
	user_letter: char;
	
	cont: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	writeln('Por favor, ingrese la letra con la que comiencen las palabras que quiere contabilizar.');
	readln(user_letter);
	
	cont:= 0;
	
	while not eof(sec) do
	begin
		while (v = ' ') do
		begin
			read(sec, v);
		end;
		
		if (v = user_letter) then
		begin
			cont:= cont + 1;
		end;
		
		while ((v <> ' ') and (not eof(sec))) do
		begin
			read(sec, v);
		end;
	end;
	
	writeln('Hay ', cont, ' letras ', user_letter, ' en la secuencia.');
	
	close(sec);
End.



