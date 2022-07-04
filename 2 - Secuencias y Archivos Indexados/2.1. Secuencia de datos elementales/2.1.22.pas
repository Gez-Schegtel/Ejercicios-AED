
{
La empresa Ideas Argentinas S.A. posee datos de sus empleados en dos secuencias de caracteres; la primera secuencia (Sec1) formada por los nombres (uno por persona) de los empleados separados por blancos y la segunda secuencia (Sec2) posee los números de documento de cada uno de los empleados (palabras de 8 dígitos numéricos). Ambas secuencias poseen la misma cantidad de datos, es decir al primer nombre de la primera secuencia le corresponde el primer número de documento de la segunda secuencia y así sucesivamente. La secuencia de números de documentos no posee espacios en blanco ni ningún otro tipo de caracter que separe un número de documento de otro.
A la empresa le interesa tener en una nueva secuencia (Sec3) los datos de todas aquellas personas que cumplan la condición de que el nombre se encuentre en una posición impar. La nueva secuencia debe generarse de la siguiente manera: el número de documento seguido (sin espacios) por una coma y luego (sin espacios) por el nombre y seguido al nombre un #. 


|A|l|i|c|e| |J|o|h|n| |R|i|l|e|y|FDS
|2|2|2|2|2|2|2|2|5|5|5|5|5|5|5|5|8|8|8|8|8|8|8|8|FDS

22222222,Alice#88888888,Riley#


Acción 2122 ES;
Ambiente
	secn: secuencia de caracter;
	vn: caracter;
	
	secd: secuencia de caracter;
	vd: caracter;
	
	sally: secuencia de caracter; 
	
	i: entero;
	paridad: entero;

Proceso
	arr(secn);
	avz(secn, vn);
	
	arr(secd);
	avz(secd, vd);
	
	crear(sally);
	
	paridad:= 1;
	
	Mientras NFDS(secn) y NFDS(secd) hacer
		
		mientras (vn = ' ') hacer
			avz(secn, vn);
		fin_mientras
		
		si (paridad mod 2 <> 0) entonces
			para i:= 1 hasta 8 hacer
				esc(sally, vd);
				avz(secd, vd);
			fin_para
			esc(sally, ',');
		
			mientras (vn <> ' ') y NFDS(secn) hacer
				esc(sally, vn);
				avz(secn, vn);
			fin_mientras
			esc(sally, '#');
		
		sino
			para i:= 1 hasta 8 hacer
				avz(secd, vd);
			fin_para
		
			mientras (vn <> ' ') y NFDS(secn) hacer
				avz(secn, vn);
			fin_mientras
		
		fin_si
		
		paridad:= paridad + 1;
			
	Fin_Mientras.
	
	cerrar(secn);
	cerrar(secd);
	cerrar(sally);

Fin_Acción.
}

Program something;
var
	secn: text;
	vn: char;
	
	secd: text;
	vd: char;
	
	sally: text; 
	
	i: integer;
	paridad: integer;

Begin
	assign(secn, 'entrada122.txt');
	reset(secn);
	read(secn, vn);
	
	assign(secd, 'entrada222.txt');
	reset(secd);
	read(secd, vd);
	
	assign(sally, 'salida22.txt');
	rewrite(sally);
	
	paridad:= 1;
	
	While not eof(secn) and not eof(secd) do 
	begin
		
		while (vn = ' ') do
		//Si la acción es simple, se pueden quitar los begin/end
		//begin
			read(secn, vn);
		//end;
		
		if (paridad mod 2 <> 0) then
		begin
			for i:= 1 to 8 do 
			begin
				write(sally, vd);
				read(secd, vd);
			end;
			write(sally, ',');
		
			while (vn <> ' ') and not eof(secn) do 
			begin
				write(sally, vn);
				read(secn, vn);
			end;
			write(sally, '#');
		end
		else
			begin
				for i:= 1 to 8 do 
				//begin
					read(secd, vd);
				//end;
			
				while (vn <> ' ') and not eof(secn) do 
				//begin
					read(secn, vn);
				//end;
			end;
		
		
		paridad:= paridad + 1;
			
	end;
	
	close(secn);
	close(secd);
	close(sally);

End.








