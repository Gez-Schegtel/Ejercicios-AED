
{
Diseñe una función que devuelva la suma de los dígitos del número natural suministrado como parámetro.

Acción 122 ES;
Ambiente
	num: entero;
	
	Función descomp_sum(N: entero): entero ES;
	Ambiente
		pas1: entero;
		acum: entero;
	Proceso
		Mientras (N <> 0) hacer
			pas1:= N mod 10;
			N:= N div 10;
			acum:= acum + pas1;
		Fin_mientras
		
		descomp_sum:= acum;
	
	Fin_Función.
	
Proceso
	esc('Ingrese un número para saber la suma de los dígitos que lo componen: ');
	leer(num);
	
	esc('El resultado es >> ', descomp_sum(num));
Fin_Acción.
}

program something;
var
	num: integer;
	
	Function descomp_sum(N: integer): integer;
	var
		pas1: integer;
		acum: integer;
		
	begin
		acum:= 0;	
		pas1:= 0;	
		
		while (N <> 0) do
		begin
			pas1:= N mod 10;
			N:= N div 10;
			acum:= acum + pas1;
		end;
		
		descomp_sum:= acum;
			
	end;

Begin
	writeln('Ingrese un número para saber la suma de los dígitos que lo componen.');
	readln(num);
	
	writeln('El resultado es >> ', descomp_sum(num));

End.


{
program something; //Esta es otra forma de realizarlo.
var
	num: integer;
	
	Function descomp_sum(N: integer): integer;
	var
		pas1: integer;
		
	begin	
		pas1:= 0;	
		descomp_sum:= 0;
		
		while (N <> 0) do
		begin
			pas1:= N mod 10; 
			N:= N div 10;
			descomp_sum:= descomp_sum + pas1;
		end;
			
	end;

Begin
	writeln('Ingrese un número para saber la suma de los dígitos que lo componen');
	readln(num);
	
	writeln('El resultado es >> ', descomp_sum(num));

End.
}










