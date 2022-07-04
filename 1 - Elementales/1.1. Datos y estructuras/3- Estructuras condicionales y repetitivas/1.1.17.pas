
{

Elabore un algoritmo que calcule el producto de dos enteros A y B empleando sólo la operación suma.

Acción 1117 ES;
Ambiente
	a: entero;
	b: entero;
	sum_s: entero;
	i: entero;
	
Proceso
	esc('Ingrese dos números: ');
	leer(a);
	leer(b);
	
	sum_s:= 0;
	
	Para i:= 1 hasta b hacer
		sum_s:= sum_s + a;
	Fin_Para
	
	esc('Su producto, resolviéndolo con el operador "*" es >> ', a*b);
	esc('Su producto, realizando el método de sumas sucesivas es >> ', sum_s);
	

Fin_Acción.

}


Program something;
var
	a: integer;
	b: integer;
	sum_s: integer;
	i: integer;

Begin
	writeln('Ingrese dos números: ');
	readln(a);
	readln(b);
	
	sum_s:= 0;
	For i:= 1 to b do 
	begin
		sum_s:= sum_s + a;	
	end;

	writeln('Su producto, resolviéndolo con el operador " * " es >> ', (a*b));
	writeln('Su producto, realizando el método de sumas sucesivas es >> ', (sum_s));

End.











