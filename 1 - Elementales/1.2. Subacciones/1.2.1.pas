
{
Realice una función que dado un número devuelva su cuadrado. 

Acción 121 ES;
Ambiente
	num: entero; //variable global
	
	
	Función quad(N: entero): entero ES;
		quad:= N**2;
	Fin_Función
	
Proceso
	esc('Ingrese un número: ');
	leer(num);
	
	esc('El cuadrado del número es >> ', quad(num));
Fin_Acción.
}

Program something;
uses math;
var
	num: integer;
	
	Function quad(N: integer): integer;
	begin
		quad:= N**2;
	end;

Begin
	writeln('Ingrese un número: ');
	readln(num);
	
	writeln('El cuadrado del número es >> ', quad(num));
End.










