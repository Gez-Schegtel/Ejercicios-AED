
{
Se posee una secuencia con los mensajes internos enviados entre los empleados de una empresa, la secuencia está formada de la siguiente manera: 3 caracteres para el destino, 3 caracteres para el origen, 3 caracteres que indican la cantidad de caracteres que tiene el mensaje y el mensaje. No existe ningún carácter que separe un mensaje de otro. se pide:

1) Escribir una secuencia de salida con todos los mensajes (incluyendo origen y destino) que van hacia el área de Mantenimiento (que destino comience con 1).
    
2)Contar la cantidad de mensajes que se dirigen hacia el área de sistemas (que destino comience con 23).


233 555 444 blabla 888777444blabla|FDS
des or  msj

Acción 2132 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	sally: secuencia de caracter;
	
	i: entero;
	acuml: entero;
	contsys: entero;
	ressys: caracter;

Proceso
	arr(sec);
	avz(sec, v);
	
	contsys:= 0;
	
	Mientras NFDS(sec) hacer
		
		acuml:= 0;
		
		si (v = '1') entonces
			para i:= 1 hasta 6 hacer
				esc(sally, v);
				avz(sec, v);
			fin_para

			para i:= 2 hasta 0, -1 hacer
				según (v) hacer
					'0': acuml:= acuml + 0 * 10**i;
					'1': acuml:= acuml + 1 * 10**i;
					'2': acuml:= acuml + 2 * 10**i;
					'3': acuml:= acuml + 3 * 10**i;
					'4': acuml:= acuml + 4 * 10**i;
					'5': acuml:= acuml + 5 * 10**i;
					'6': acuml:= acuml + 6 * 10**i;
					'7': acuml:= acuml + 7 * 10**i;
					'8': acuml:= acuml + 8 * 10**i;
					'9': acuml:= acuml + 9 * 10**i;
				fin_según
				avz(sec, v);
			fin_para
			
			para i:= 1 hasta acuml hacer
				esc(sally, v);
				avz(sec, v);
			fin_para
			
		sino
			ressys:= v;
			avz(sec, v);
			si (ressys = '2') y (v = '3') entonces
				contsys:= contsys + 1;
			fin_si
			
			para i:= 1 hasta 5 hacer
				avz(sec, v);
			fin_para
		
			para i:= 2 hasta 0, -1 hacer
				según (v) hacer
					'0': acuml:= acuml + 0 * 10**i;
					'1': acuml:= acuml + 1 * 10**i;
					'2': acuml:= acuml + 2 * 10**i;
					'3': acuml:= acuml + 3 * 10**i;
					'4': acuml:= acuml + 4 * 10**i;
					'5': acuml:= acuml + 5 * 10**i;
					'6': acuml:= acuml + 6 * 10**i;
					'7': acuml:= acuml + 7 * 10**i;
					'8': acuml:= acuml + 8 * 10**i;
					'9': acuml:= acuml + 9 * 10**i;
				fin_según
				avz(sec, v);
			fin_para

			para i:= 1 hasta acuml hacer
				avz(sec, v);
			fin_para
			
		fin_si
		 			
	Fin_Mientras

	writeln('Número de mensajes dirigidos al área de sistemas >> ', contsys);
	
	cerrar(sec);
	cerrar(sally);
Fin_Acción.
}



program something;
uses math;
var
	sec: text;
	v: char;
	
	sally: text;
	
	i: integer;
	acuml: integer;
	contsys: integer;
	ressys: char;

Begin
	assign(sec, 'entrada32.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida32.txt');
	rewrite(sally);
	
	contsys:= 0;
	
	while not eof(sec) do 
	begin
		acuml:= 0;
		
		if (v = '1') then
		begin
			for i:= 1 to 6 do
			begin
				write(sally, v);
				read(sec, v);
			end;
			
			
			for i:= 2 downto 0 do 
			begin
				case (v) of
					'0': acuml:= acuml + 0 * 10**i;
					'1': acuml:= acuml + 1 * 10**i;
					'2': acuml:= acuml + 2 * 10**i;
					'3': acuml:= acuml + 3 * 10**i;
					'4': acuml:= acuml + 4 * 10**i;
					'5': acuml:= acuml + 5 * 10**i;
					'6': acuml:= acuml + 6 * 10**i;
					'7': acuml:= acuml + 7 * 10**i;
					'8': acuml:= acuml + 8 * 10**i;
					'9': acuml:= acuml + 9 * 10**i;
				end;
				read(sec, v);
			end;
			
			for i:= 1 to acuml do
			begin
				write(sally, v);
				read(sec, v);
			end;
			
		end
		else
			begin
				ressys:= v;
				read(sec, v);
				if (ressys = '2') and (v = '3') then
				begin
					contsys:= contsys + 1;
				end;
				
				for i:= 1 to 5 do 
				begin
					read(sec, v);
				end;
			
				for i:= 2 downto 0 do 
				begin
					case (v) of
						'0': acuml:= acuml + 0 * 10**i;
						'1': acuml:= acuml + 1 * 10**i;
						'2': acuml:= acuml + 2 * 10**i;
						'3': acuml:= acuml + 3 * 10**i;
						'4': acuml:= acuml + 4 * 10**i;
						'5': acuml:= acuml + 5 * 10**i;
						'6': acuml:= acuml + 6 * 10**i;
						'7': acuml:= acuml + 7 * 10**i;
						'8': acuml:= acuml + 8 * 10**i;
						'9': acuml:= acuml + 9 * 10**i;
					end;
					read(sec, v);
				end;

				for i:= 1 to acuml do
				begin
					read(sec, v);
				end;
				
			end;
		 			
	end;
	
	writeln('Número de mensajes dirigidos al área de sistemas >> ', contsys);
	
	close(sec);
	close(sally);
End.








