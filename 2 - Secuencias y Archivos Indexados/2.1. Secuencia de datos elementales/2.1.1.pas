
{
Dada una secuencia de letras del alfabeto que finaliza con una marca '*', contar cuantas letras "A" hay en la secuencia.

//En vez de FDS sabemos que termina con un '*', pero es la misma milonga

Acción 211 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	cont_a: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	cont_a:= 0;
	
	mientras (v <> '*') hacer
		si (v = 'A') entonces
			cont_a:= cont_a + 1;
		fin_si
		
		avz(sec, v);
	fin_mientras
	
	esc('Hay ', cont_a, ' letras A en la secuencia.');
	
	cerrar(sec);
	
Fin_Acción.
}

program something;
var 
	sec: text;
	v: char;
	
	cont_a: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	cont_a:= 0;
	
	while (v <> '*') do
	begin
		if (v = 'A') then
		begin
			cont_a:= cont_a + 1;
		end;
		
		read(sec, v);
	end;
	
	writeln('Hay ', cont_a, ' letras A en la secuencia.');
	
	close(sec);
End.











