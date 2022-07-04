

{
Dada una secuencia de caracteres de entrada, desarrollar un algoritmo que produzca una secuencia de salida de caracteres; la que contendrá solo los caracteres “numéricos” correspondientes a dígitos impares encontrados en la secuencia de entrada.

Ejemplo: Si en la entrada viniera A125EB% en la salida debería ir 15.

Al final del proceso informar:

    1) Cuantos dígitos impares encontró
    2) Cuantos dígitos pares
    3) Total de caracteres “numéricos” (dígitos) y porcentaje de pares e impares


Acción 221 ES;
Ambiente
	impares = ('1', '3', '5', '7', '9');
	pares = ('2', '4', '6', '8');
	
	sec: secuencia de caracter; 
	v: caracter;
	
	sally: secuencia de caracter;

	contot: entero; 
	contp: entero;
	conti: entero;

Proceso 
	arr(sec);
	avz(sec, v);
	
	crear(sally);
	
	contp:= 0;
	conti:= 0;
	
	Mientras NFDS(sec) hacer
		
		si (v en impares) entonces
			esc(sally, v);
			conti:= conti + 1;
		sino
			si (v en pares) entonces 
				contp:= contp + 1;
			fin_si	
		fin_si
		
		avz(sec, v);
		
	Fin_Mientras
	
	contot:= contp + conti;
	
	esc('Total de dígitos numéricos encontrados >> ', contot);
	esc('Total de dígitos pares >> ', contp);
	esc('Total de dígitos impares >> ', conti);
	esc('Porcentaje de pares sobre el total >> ', contp*100/contot, '%');
	esc('Porcentaje de impares sobre el total >> ', conti*100/contot, '%');
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.
}

program something;
const
	impares = ['1', '3', '5', '7', '9'];
	pares = ['2', '4', '6', '8'];
var
	sec: text; 
	v: char;
	
	sally: text;

	contot: integer; 
	contp: integer;
	conti: integer;

Begin
	assign(sec, 'entrada1.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida1.txt');
	rewrite(sally);
	
	contp:= 0;
	conti:= 0;
	
	while not eof(sec) do 
	begin
		
		if (v in impares) then
		begin
			write(sally, v);
			conti:= conti + 1;
		end
		else
			if (v in pares) then
			begin 
				contp:= contp + 1;
			end;	
		
		read(sec, v);
		
	end;
	
	contot:= contp + conti;
	
	writeln('Total de dígitos numéricos encontrados >> ', contot);
	writeln('Total de dígitos pares >> ', contp);
	writeln('Total de dígitos impares >> ', conti);
	writeln('Porcentaje de pares sobre el total >> ', contp*100/contot:0:2, '%');
	writeln('Porcentaje de impares sobre el total >> ', conti*100/contot:0:2, '%');
	
	close(sec);
	close(sally);
	
End.

