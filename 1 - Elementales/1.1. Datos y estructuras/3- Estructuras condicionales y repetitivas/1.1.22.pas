
{
Escriba un algoritmo que determine si un número es primo.

Acción 1122 ES;
Ambiente
	num: entero;
	divisor: entero;
	
Proceso
	esc('Ingrese un número para evaluar si es primo: ');
	leer(num);
	
	divisor:= 2;
	
	Mientras (divisor < num) and (num mod divisor <> 0) hacer
		divisor:= divisor + 1;
	Fin_Mientras
	
	Si (divisor = num) entonces
		esc(num, ' es un número primo.');
	sino
		esc(num, ' no es un número primo.');
	Fin_si
	
Fin_Acción.

}


program numprim;
var
	num: integer;
	divisor: integer;
	
Begin
	writeln('Ingrese un número para evaluar si es primo: ');
	readln(num);
	
	divisor:= 2;
	
	While (divisor < num) and ((num mod divisor) <> 0) do
	begin
		divisor:= divisor + 1;
	end;
	
	If (divisor = num) then
	begin
		writeln(num, ' es un número primo.');
	end
	else
		writeln(num, ' no es un número primo.');
	
End.








