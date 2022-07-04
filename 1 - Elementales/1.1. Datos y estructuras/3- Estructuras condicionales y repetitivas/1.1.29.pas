
{
Escriba un algoritmo para imprimir los números primos menores a un valor dado n.

Acción 1129 ES;
Ambiente
	num: entero;
	divisor: entero;
	i: entero;

Proceso
	esc('Este programa imprime los números primos menores a un entero dado');
	esc('Ingrese un número: ');
	leer(num);
	
	Para i:= 2 hasta n hacer
		divisor:= 2;
		
		mientras (divisor < i) and ( i mod divisor <> 0) hacer
			divisor:= divisor + 1;
		fin_mientras
		
		si (divisor = i) entonces
			esc(i);
		fin_si
	Fin_Para
Fin_Acción.
}

program primnums;
uses crt;
var 
	num: integer;
	divisor: integer;
	i: integer;

begin 
	writeln('Este programa imprime los número primos menores a un número dado.');
	writeln('Ingrese un número: ');
	readln(num);
	
	for i:= 2 to num do 
	begin 
		divisor:= 2;
		
		while (divisor < i) and (i mod divisor <> 0) do 
		begin 		
			divisor:= divisor + 1;
		end;
		
		if (divisor = i) then
		begin
			writeln(i);
		end; 
	end;
end.











