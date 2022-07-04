
{
Crear un procedimiento que intercambie los valores de dos variables numéricas.

Acción 128 ES;
Ambiente
	numA: entero;
	numB: entero;
	
	procedimiento change_var(A, B: entero;) ES;
	ambiente
		// no hace falta en este ejercicio
	proceso
		numA:= B;
		numB:= A;
		
	fin_procedimiento
	
Proceso
	esc('Ingrese una variable "A" y luego una variable "B": ');
	leer(numA); leer(numB);
	esc('Valor A: ', numA, '  |||  Valor B: ', numB);
	
	change_var(numA, numB);
	
	esc('Valor A: ', numA, '  |||  Valor B: ', numB);
Fin_Acción.

}

program valores;
var
	numA: integer;
	numB: integer;
	
	procedure change_var(A, B: integer);
	begin
		numA:= B;
		numB:= A;
	end;

Begin
	writeln('Ingrese una variable "A": ');
	readln(numA);
	
	writeln('Ingrese una variable "B": ');
	readln(numB);
	
	writeln('El valor de A es >> ', numA);
	writeln('El valor de B es >> ', numB);
	
	change_var(numA, numB);
	
	writeln('El valor de A es >> ', numA);
	writeln('El valor de B es >> ', numB);
	
End.




