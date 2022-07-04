
{
Todo número cuya suma de sus dígitos sea múltiplo de 3 lo es también. Ej: 117 → 1+1+7 = 9 que es múltiplo de 3 , entonces 117 es múltiplo de 3 Realizar un algoritmo que determine si un número es múltiplo de 3 en función de la afirmación antes realizada

Acción 1136 ES;
Ambiente
	num: entero;
	pas1: entero;
	acuml: entero;

Proceso
	esc('Ingrese un número: ');
	leer(num);
	
	acuml:= 0;
	mientras (num <> 0) hacer
		pas1:= num mod 10;
		acuml:= acuml + pas1;
		num:= num div 10;
	fin_mientras
	
	si ((acuml mod 3) = 0) entonces
		esc('El número es múltiplo de 3.');
	sino
		esc('El número no es múltiplo de 3.');
	fin_si
	
Fin_Acción.

}


program mult;
var 
	num: integer;
	pas1: integer;
	acuml: integer; 

Begin
	writeln('Ingrese un número: ');
	readln(num);
	
	acuml:= 0;
	while (num <> 0) do
	begin
		pas1:= num mod 10;
		acuml:= acuml + pas1;
		num:= num div 10;
	end;
		
	if ((acuml mod 3) = 0) then
	begin
		writeln('El número es múltiplo de 3.');
	end
	else
		writeln('El número no es múltiplo de 3.');
End.
