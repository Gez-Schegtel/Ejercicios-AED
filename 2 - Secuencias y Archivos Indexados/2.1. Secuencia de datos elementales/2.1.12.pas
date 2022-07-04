
{
Se dispone de una secuencia de caracteres. Se desea listar las palabras que comiencen con "ALG".

|A| |A|L|G|O| |F|L|O|T|A| |E|N| |L|A| |L|A|G|U|N|A| |A|L|A|C|E|N|A| |A|L|G|U|N|A|FDS

Acción 2112 ES;
Ambiente
	sec: secuencia de caracter:
	v: caracter;

Proceso
	arr(sec);
	avz(sec, v);
	
	Mientras NFDS(sec) hacer
		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras
		
		si (v = 'A') entonces
			avz(sec, v);
			
			si (v = 'L') entonces
				avz(sec, v);
				
				si (v = 'G') entonces
					avz(sec, v);
					
					si (v <> ' ') entonces
						esc('ALG');
						
						mientras (v <> ' ') y NFDS(sec) hacer
							esc(v);
							avz(sec, v);
						fin_mientras
						esc(' '); //escribe un espacio entre las palabras
					fin_si
				fin_si
			fin_si
		fin_si
		
		mientras (v <> ' ') y NFDS(sec) hacer
			avz(sec, v);
		fin_mientras
		
	Fin_Mientras
	
	cerrar(sec);
Fin_Acción.
}

program something;
var 
	sec: text;
	v: char;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
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
					write(' ');
				end;
			end;
		end;
		
		while (v <> ' ') and not eof(sec) do 
		begin
			read(sec, v);
		end;
	end;
	
	close(sec);
End.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
