{
Escribir un programa que permita calcular el precio de un artículo para un año dado, considerando que la inflación es del 4 por 100 anual.

La fórmula del precio es: P = C * (1 + R) ^ (N - A)

C - Precio actual.
N - Año futuro.
R - Tasa de Inflación.
A - Año actual. 

[Cada año que pasa, las cosas se hacen un 4% más caras]



Acción 1.5.1 ES;
Ambiente
	C: real;
	N: entero;
	A: entero;
	P: real;
	
	R = 0.04;
	
Proceso
	esc('Ingrese el precio actual del producto.');
	leer(C);
	
	esc('Ingrese el año actual.');
	leer(A);
	
	esc('Ingrese el año sobre el que desee hacer la estimación.');
	leer(N);
	
	P:= C * (1 + R) ** (N - A)

	esc('La estimación de precio es de >> ', P);
Fin.

}


Program pricecalq;
uses math, crt;
var
	C: real;
	N: integer;
	A: integer;
	P: real;

const
	R = 0.04;
	
Begin
	clrscr;

	writeln('Ingrese el precio actual del producto.');
	readln(C);
	
	writeln('Ingrese el año actual.');
	readln(A);
	
	writeln('Ingrese el año sobre el que desee hacer la estimación de precio.');
	readln(N);
	
	P:= C * ((1 + R) ** (N - A));
	
	writeln('');
	writeln('El precio estimado del producto para el año ', N, ' es de >> ', P:0:2);
	writeln('');
	
End.














