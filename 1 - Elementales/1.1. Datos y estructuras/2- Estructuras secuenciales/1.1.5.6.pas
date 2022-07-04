
{
Realizar un programa que lea dos número complejos (a,b) y (c,d) y calcule su producto:

	#Recordar >> (a,b)∗(c,d) = (ac−db,ad+bc)
}

{
Acción 156 ES;
Ambiente
	a: entero;
	b: entero;
	c: entero;
	d: entero;
	resultR: entero;
	resultI: entero;
	
Proceso
	esc('Ingrese un número complejo, indicando primero la parte real y luego la imaginaria:');
	leer(a);
	leer(b);
	esc('Ingrese un número complejo, indicando primero la parte real y luego la imaginaria:');
	leer(c);
	leer(d);
	
	resultR:= a*c - d*b;
	resultI:= a*d + b*c;
	
	esc('El resultado es: ', resultR, resultI, 'i');
Fin.
}
	
Program complexnumbers;
uses crt;
var
	a: integer;
	b: integer;
	c: integer;
	d: integer;
	resultR: integer;
	resultI: integer;

Begin
	clrscr;
	writeln('Ingrese un número complejo, indicando primero la parte real y luego la imaginaria:');
	read(a); read(b);

	writeln('Ingrese un número complejo, indicando primero la parte real y luego la imaginaria:');
	read(c); read(d);
	
	resultR:= a*c - d*b;
	
	resultI:= a*d + b*c;
	
	if resultI > 0 then
	begin
		writeln('El resultado es >> ', resultR, '+', resultI, 'i');
	end
		else
		begin
			writeln('El resultado es >> ', resultR, resultI, 'i');
		end;		
End.





