
{
A partir del ejercicio anterior, determinar el porcentaje que representan las palabras que comienzan con "ALG" sobre todas las palabras de la secuencia.

|A| |A|L|G|O| |F|L|O|T|A| |E|N| |L|A| |L|A|G|U|N|A| |A|L|A|C|E|N|A| |A|L|G|U|N|A|FDS

Acción 2112 ES;
Ambiente
	sec: secuencia de caracter:
	v: caracter;
	
	contp: entero; //contp significa contador "parcial"
	contot: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	contp:= 0;
	contot:= 0;
	
	Mientras NFDS(sec) hacer
		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras
	
		contot:= contot + 1;
	
		si (v = 'A') entonces
			avz(sec, v);
			
			si (v = 'L') entonces
				avz(sec, v);
				
				si (v = 'G') entonces
					avz(sec, v);
					
					si (v <> ' ') entonces
						esc('ALG');
						
						mientras NFDS(sec) y (v <> ' ') hacer
							esc(v);
							avz(sec, v);
						fin_mientras
						esc(' '); //escribe un espacio entre las palabras
						contp:= contp + 1;
					fin_si
				fin_si
			fin_si
		fin_si
		
		mientras NFDS(sec) y (v <> ' ') hacer 
			avz(sec, v);
		fin_mientras
		
	Fin_Mientras
	
	esc('El total de palabras que empieza con "ALG" representa el ', (contp*100)/contot, '% del total.');
	cerrar(sec);
Fin_Acción.
}

program something;
var
	sec: text;
	v: char;
	
	contp: integer;//contp significa contador "parcial"
	contot: integer;
	
Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	contp:= 0;
	contot:= 0;
	
	while not eof(sec) do 
	begin
		while (v = ' ') do
		begin
			read(sec, v);
		end;
		
		if (v = 'A') then
		begin
			read(sec, v);
			
			if (v = 'L') then
			begin
				read(sec, v);
				
				if (v = 'G') then
				begin
					write('ALG');
					read(sec, v);
					
					while (v <> ' ') and not eof(sec) do
					begin
						write(v);
						read(sec, v);
					end;
					
					write(' '); //escribe un espacio entre las palabras
					contp:= contp + 1;
				end;
			end;
		end;
		
		while (v <> ' ') and not eof(sec) do 
		begin
			read(sec, v);
		end;
		
		contot:= contot + 1;
	end;
	
	writeln(#13#10, 'El total de palabras que empieza con "ALG" representa el ', ((contp*100)/contot):0:2, '% del total.');
	close(sec);
End.

























