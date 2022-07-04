
{
Diseñe una función que permita ingresar 3 números y devuelva el mínimo valor. El programa principal debe permitir que este proceso se repita la cantidad de veces que el usuario desee.

Acción 123 ES;
Ambiente
	num1: entero;
	num2: entero;
	num3: entero;
	op: caracter;
	
	Función searchminor(n1, n2, n3: entero): entero ES; 
	
	Proceso
		si (n1 < n2) and (n1 < n3) entonces	
			searchminor:= n1;			
		sino
			si (n2 < n1) and (n2 < n3) entonces
				searchminor:= n2;
			sino
				si (n3 < n1) and (n3 < n2) entonces
					searchminor:= n3;
				sino
					esc('Error.');
				fin_si
			fin_si
		fin_si
			 
	Fin_Función.
	
	
Proceso
	esc('¿Desea iniciar el programa? s/n');
	leer(op);
	
	Mientras (op = s) hacer
		esc('Ingrese tres números para evaluar su valor: ');
		leer(num1);
		leer(num2);
		leer(num3);
		
		esc('El menor de los número ingresados es >> ', searchminor(num1, num2, num3));
	
		esc('¿Desea ejecutar nuevamente el programa?');
		leer(op);
	Fin_Mientras


Fin_Acción.
}

Program something;
uses crt;
var
	num1: integer;
	num2: integer;
	num3: integer;
	op: char;
	
	Function searchminor(n1, n2, n3: integer): integer; 
	Begin
		if (n1 < n2) and (n1 < n3) then	
		begin
			searchminor:= n1;			
		end
		else
			if (n2 < n1) and (n2 < n3) then
			begin
				searchminor:= n2;
			end
			else
				if (n3 < n1) and (n3 < n2) then
				begin
					searchminor:= n3;
				end
				else
					writeln('Error.');

	end;
	
	
Begin
	clrscr;
	writeln('¿Desea iniciar el programa? s/n');
	readln(op);
	
	while (op = 's') do
	begin
		writeln('Ingrese tres números para evaluar su valor: ');
		readln(num1);
		readln(num2);
		readln(num3);
		
		writeln('El menor de los número ingresados es >> ', searchminor(num1, num2, num3));
	
		writeln('¿Desea ejecutar nuevamente el programa? s/n');
		readln(op);
	end;


End.




