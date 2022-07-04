
{

Escribir un algoritmo que produzca una secuencia de salida que contenga una oración formada por las palabras en posición par de cada oración de una secuencia texto de entrada, que además comienzan con la letra 'M'.

Acción 2118 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	sal: secuencia de caracter;
	
	cont: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sal);
	
	mientras NFDS(sec) hacer
		
		cont:= 1;
		
		mientras (v <> '.') hacer
		
			mientras (v = ' ') hacer
				avz(sec, v);
			fin_mientras
				
			si (cont MOD 2 = 0) y (v = 'M') entonces
				mientras (v <> ' ') y (v <> '.') hacer
					esc(sal, v);
					avz(sec, v);
				fin_mientras
				esc(sal, ' ');
			
			sino
				mientras (v <> ' ') y (v <> '.') hacer
					avz(sec, v);
				fin_mientras
			fin_si
		
			cont:= cont + 1; 
		
		fin_mientras
		
		avz(sec, v); 
	
	fin_mientras
	
	cerrar(sec);
	cerrar(sal);
	
Fin_Acción.

}

program something;
var
	sec: text;
	v: char;
	
	sal: text;

	cont: integer;
	
Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	assign(sal, 'salida18.txt');
	rewrite(sal);
	
	while not eof(sec) do
	begin
		cont:= 1;
		while (v <> '.') do
		begin
		
			while (v = ' ') do
			begin
				read(sec, v);
			end;
				
			if ((cont MOD 2 = 0) and (v = 'M')) then
			begin
				while ((v <> ' ') and (v <> '.')) do
				begin
					write(sal, v);
					read(sec, v);
				end;
				
				write(sal, ' ');
			
			end
			else
				begin
					while ((v <> ' ') and (v <> '.') ) do
					begin
						read(sec, v);
					end;
				end;
		
			cont:= cont + 1; 
		
		end;
		
		read(sec, v); 
	end;
	
	close(sec);
	close(sal);
End.



  
  
