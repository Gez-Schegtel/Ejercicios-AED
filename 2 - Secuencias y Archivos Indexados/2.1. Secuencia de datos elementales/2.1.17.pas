
{
Se desea calcular el costo de un telegrama, que se determina en función del número de palabras (que vale V1 cada una), salvo que el promedio de letras por palabra supere las cinco letras, caso en que cada palabra vale V2.


	prom let/pal > 5, c/pal => v2
sino
	prom let/pal < 5 c/pal => v1	

//tengo que contar letras y palabras//


Hola che. River Plate.FDS


Acción 2117 ES;
Ambiente
	v1 = 100;
	v2 = 150:
	
	sec: secuencia de caracter;
	v: caracter; 
	
	contlet: entero;
	contpal: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	contpal:= 0; 
	contlet:= 0;
	
	Mientras NFDS(sec) hacer
		
		mientras (v = ' ') hacer
			avz(sec, v);			
		fin_mientras
		
		contpal:= contpal + 1;
		
		mientras (v <> ' ') y (v <> '.') hacer
			contlet:= contlet + 1; 
			avz(sec, v);
		fin_mientras
		
		avz(sec, v);
	Fin_Mientras
	
	si (contlet/contpal > 5) entonces
		esc('El mensaje tiene un costo de $', contpal*v2, ' pesos argentinos.');
	sino
		esc('El mensaje tiene un costo de $', contpal*v1, ' pesos argentinos.');
	fin_si
	
	cerrar(sec);
Fin_Acción.
}

Program something;
Const
	v1 = 100;
	v2 = 150;

Var
	sec: text;
	v: char; 

	contpal: integer;
	contlet: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	contlet:= 0;
	contpal:= 0;
	
	while not eof(sec) do 
	begin
	
		while (v = ' ') do 
		begin
			read(sec, v);
		end;
		
		contpal:= contpal + 1;
		
		while (v <> ' ') and (v <> '.') do 
		begin
			contlet:= contlet + 1;
			read(sec, v);
		end;
		
		read(sec, v);
	end;
	
	if (contlet/contpal > 5) then
	begin
		writeln('El mensaje tiene un costo de $', contpal*v2, ' pesos argentinos.');
	end
	else
		begin
			writeln('El mensaje tiene un costo de $', contpal*v1, ' pesos argentinos.');
		end;
	
	//write(contlet, '-', contpal, #13#10); //esto lo pongo para probar si contó bien
	close(sec);
End. 




































