
{
Generar un algoritmo para imprimir las coordenadas (X,Y) de una función cuadrática, de la forma: Y=aX**2+bX+c, haciendo variar X en el intervalo [20,−20] con un decremento de 2.

Acción 1126 ES;
Ambiente
	a: real;
	b: real;
	c: real;
	X: real;
	Y: real;
Proceso
	esc('Ingrese el valor del coeficiente a, b y c de la función cuadrática.');
	leer(a);
	leer(b);
	leer(c);
	
	Para X:= 20 hasta -20, -2 hacer
		Y:= (a)*X**2 + (b)*X + c;
		esc('El valor de Y es >> ', Y);
		esc('El valor de X es >> ', X);
	Fin_Para
Fin_Acción.
}

Program cuadratic;
uses math, crt;
var 
	a: integer;
	b: integer;
	c: integer;
	X: integer;
	Y: integer;
	
Begin 
	writeln('Ingrese el valor del coeficiente a, b y c de la función cuadrática.');
	readln(a);
	readln(b);
	readln(c);	
	
	X:= 20;
	
	//** Lo hago con un pre-test porque en pascal no se puede hacer in/de/crementos mayores a 1/-1
	
	while (X >= -20) do
	begin
		Y:= (a)*X**2 + (b)*X + c;
		
		TextColor(LightMagenta);
		writeln('El valor de Y es >> ', Y, #13#10);
		TextColor(LightBlue);
		writeln('El valor de X es >> ', X);
		
		X:= X - 2;
	end;
End.







