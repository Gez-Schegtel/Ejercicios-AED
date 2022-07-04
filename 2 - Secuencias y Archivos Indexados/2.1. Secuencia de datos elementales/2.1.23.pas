
{
Realice un algoritmo para el enunciado del ejercicio 1.22, pero considerando que los datos que se deben copiar en la Sec3 son los de aquellas personas que cumplan la condición de que: el número de documento comienza con un número impar.

|A|l|i|c|e| |J|o|h|n| |R|i|l|e|y|FDS
|2|2|2|2|2|2|2|2|5|5|5|5|5|5|5|5|8|8|8|8|8|8|8|8|FDS

22222222,Alice#88888888,Riley#


Acción 2122 ES;
Ambiente
	pares = ('2', '4', '6', '8');
	
	secn: secuencia de caracter;
	vn: caracter;
	
	secd: secuencia de caracter;
	vd: caracter;
	
	sally: secuencia de caracter; 
	
	i: entero;

Proceso
	arr(secn);
	avz(secn, vn);
	
	arr(secd);
	avz(secd, vd);
	
	crear(sally);
	
	Mientras NFDS(secn) y NFDS(secd) hacer
		
		mientras (vn = ' ') hacer
			avz(secn, vn);
		fin_mientras
		
		si (vd no en pares) entonces
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
		
	Fin_Mientras.
	
	cerrar(secn);
	cerrar(secd);
	cerrar(sally);

Fin_Acción.
}

Program something;
const
	pares = ['2', '4', '6', '8'];
var
	secn: text;
	vn: char;
	
	secd: text;
	vd: char;
	
	sally: text; 
	
	i: integer;
	
Begin
	assign(secn, 'entrada122.txt');
	reset(secn);
	read(secn, vn);
	
	assign(secd, 'entrada222.txt');
	reset(secd);
	read(secd, vd);
	
	assign(sally, 'salida23.txt');
	rewrite(sally);
	
	While not eof(secn) and not eof(secd) do 
	begin
		
		while (vn = ' ') do
		//Si la acción es simple, se pueden quitar los begin/end
		//begin
			read(secn, vn);
		//end;
		
		if not(vd in pares) then
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
			
	end;
	
	close(secn);
	close(secd);
	close(sally);

End.
