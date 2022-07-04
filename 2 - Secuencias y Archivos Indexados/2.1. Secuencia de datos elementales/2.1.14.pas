
{
Se dispone de una secuencia de caracteres y se desea saber la cantidad de caracteres (incluidos los espacios) que existen entre una coma y la siguiente. Se debe considerar que puede haber más de un par de comas, y que las subsecuencias inicial y final deben descartarse por no cumplir la condición enunciada. Supóngase que las comas son siempre contiguas al último caracter de la palabra.

|a|s|d|a|s|d|,|,|a|s|d|,|,| |a|s|d||s|a|d|,| |a|s|d|d|a|a|a|s|d|,|s|d|a|d|,|,|FDS

alonso,, vettel, h,e,,FDS


Acción 2114 ES;
Ambiente
	sec: secuencia de caracter; 
	v: caracter;
	
	cont: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	mientras (v <> ',') hacer
		avz(sec, v);
	fin_mientras
	
	cont:= 0;
	
	Mientras NFDS(sec) hacer
		
		mientras (v = ',') hacer
			avz(sec, v);
		fin_mientras
		
		mientras (v <> ',') y NFDS(sec) hacer
			cont:= cont + 1;
			avz(sec, v);
		fin_mientras	
		
	Fin_Mientras
	
	esc('El total de caracteres entre comas es >> ', cont);
	
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
	
	while (v <> ',') do 
	begin
		read(sec, v);
	end;
	
	cont:= 0; //cuento el total de toda la secuencia, no por pares
	
	while not eof(sec) do 
	begin
		while (v = ',') do 
		begin
			read(sec, v);
		end;
		
		while (v <> ',') and not eof(sec) do 
		begin
			cont:= cont + 1;
			read(sec, v);
		end;
	end;
	
	writeln('El total de caracteres entre comas es >> ', cont);
	close(sec);
End.













