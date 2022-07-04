{
Construya un algoritmo capaz de encontrar todas las cifras de tres dígitos que cumplan con la condición de que la suma de los cubos de sus dígitos sea igual al número que la cifra representa.

Acción 1128 ES;
Ambiente
	i: entero;
	num: entero;
	pas1: entero;
	acuml: entero;

Proceso
	acuml:= 0;
	esc('Este programa encuentra los números los cuales la suma de los dígitos que lo componen, al cubo, coincide con su valor.');
	Para i:= 100 hasta 999 hacer
		Mientras (num <> 0) hacer
			pas1:= num mod 10;
			acuml:= acuml + pas1**3;
			num div 10
		Fin_Mientras
		
		Si (acuml = i) entonces
			esc('El número ', i, 'cumple la condición');
		fin_si
		
		acuml:= 0;
	Fin_Para
		
Fin_Acción.
}


program nums;
uses crt, math;
var 
	i: longint;
	num: longint;
	pas1: longint;
	acuml: longint;
Begin 
	acuml:= 0;
	
	writeln('Este programa encuentra los números los cuales la suma de los dígitos que lo componen, al cubo, coincide con su valor.');
	
	for i:= 100 to 999 do 
	begin
		num:= i;		
		while (num <> 0) do
		begin
			pas1:= num mod 10;
			acuml:= acuml + pas1**3;
			num:= num div 10;
		end;	
		
		if (acuml = i) then
		begin
			writeln('El número ', i, ' cumple la condición.');
		end;
		
		acuml:= 0;
	end
End.







