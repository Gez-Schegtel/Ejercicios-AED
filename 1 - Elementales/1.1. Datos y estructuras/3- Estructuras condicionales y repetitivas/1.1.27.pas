
{
Repita el ejercicio anterior de modo que sea posible estudiar varias funciones, indicando que se desea terminar al ingresar 9999 para el término cuadrático.

Acción 1127 ES;;
Ambiente 
	a: entero;
	b: entero;
	c: entero;
	X: entero;
	Y: entero;
	
Proceso 
	esc('Este programa analiza las coordenadas X e Y de una función cuadrática.');
	esc('Para terminar el proceso, ingrese como término cuadrático 9999.');
	
	esc('Ingrese el valor del coeficiente a, b y c de la función cuadrática.');
	leer(a);
	
	Mientras (a <> 9999) hacer
		
		leer(b);
		leer(c);	
		
		X:= 20;
		
		Mientras (X >= -20) hacer
		
			Y:= (a)*X**2 + (b)*X + c;
			
			esc('El valor de Y es >> ', Y);
			esc('El valor de X es >> ', X);
			
			X:= X - 2;
			
		Fin_Mientras
		
		esc('Si desea analizar otra función, puede ingresar los términos a, b y c de la función,');
		esc('Para terminar, ingrese 9999 como término cuadrático.');
		leer(a);
	
	Fin_Mientras
	
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
	writeln('Este programa analiza las coordenadas X e Y de una función cuadrática.');
	writeln('Para terminar el proceso, ingrese como término cuadrático 9999.');
	
	writeln(#13#10, 'Ingrese el valor del coeficiente a, b y c de la función cuadrática.');
	readln(a);
	
	while (a <> 9999) do
	begin 
		
		readln(b);
		readln(c);	
		
		X:= 20;
		
		while (X >= -20) do
		begin
			Y:= (a)*X**2 + (b)*X + c;
			
			TextColor(LightMagenta);
			writeln(#13#10, 'El valor de Y es >> ', Y);
			TextColor(LightBlue);
			writeln('El valor de X es >> ', X);
			
			X:= X - 2;
		end;
		
		TextColor(LightGray);
		writeln('Si desea analizar otra función, puede ingresar los términos a, b y c de la función,');
		writeln('Para terminar, ingrese 9999 como término cuadrático.');
		readln(a);
	end;
End.


