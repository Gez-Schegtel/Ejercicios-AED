
{
Se desea saber la cantidad promedio de palabras que contienen las oraciones de una secuencia de caracteres. Supóngase que los puntos son siempre contiguos al último caracter de la palabra. La secuencia finaliza con una marca.

Hola che. River Plate.#

Acción 2115 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter; 
	
	contpal: entero;
	contor: entero; 
	
Proceso
	arr(sec);
	avz(sec, v);
	
	contpal:= 0;
	contor:= 0;
	
	Mientras (v <> '#') hacer 
	
		Mientras (v <> '.') hacer
			
			//Trato los blancos
			Mientras (v = ' ') hacer
				avz(sec, v);
			Fin_Mientas
			
			//Como salgo en un caracter <> blanco, quiere decir que estoy en una palabra.
			contpal:= contpal + 1;
			
			//Avanzo caracteres sin contar el blanco ni el punto
			Mientras (v <> ' ') y (v <> '.') hacer
				avz(sec, v);
			Fin_Mientras
	
		Fin_Mientras
		
		//Como salgo en un punto, quiere decir que pasé por una oración
		contor:= contor + 1;
		
		avz(sec, v);
	
	Fin_Mientras
	
	esc('Cantidad de palabras >> ', contpal);
	esc('Cantidad de oraciones >> ', contor);
	esc('Promedio de palabras por oración >> ', contpal/contor);
	cerrar(sec);
	
Fin_Acción.
}

Program something;
Var
	sec: text;
	v: char;
	
	contpal: integer;
	contor: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	contpal:= 0;
	contor:= 0;
	
	while (v <> '#') do 
	begin
		while (v <> '.') do 
		begin
			while (v = ' ') do 
			begin
				read(sec, v);
			end;	
				
			contpal:= contpal + 1;
			
			while (v <> ' ') and (v <> '.') do 
			begin
				read(sec, v);
			end;
		end;
		
		contor:= contor + 1;
		read(sec, v);
	end;
	
	writeln('Cantidad de palabras >> ', contpal);
	writeln('Cantidad de oraciones >> ', contor);
	writeln('Promedio de palabras por oración >> ', contpal/contor:0:2);
	
	close(sec);
End.






























