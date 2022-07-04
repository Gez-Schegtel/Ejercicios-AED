
{
Escribir un algoritmo que ingrese una variable V y emita el valor de ésta, su cuadrado y su cubo.

Acción 1119 ES;
Ambiente
	v: entero;
	i: entero;
	
	
Proceso
	esc('Por favor, ingrese un valor numérico.');
	leer(v);
	
	Para i: 1 hasta 3 hacer

		
		si (i = 1) entonces
			esc('El valor del número es: ' v**i);
		sino
			si (i = 2) entonces
				esc('El valor del número al cuadrado es: ', v**i);
			sino
				si (i = 3) entonces
					esc('El valor del número al cubo es: ', v**i);
				fin
			fin 
		fin	
		
	Fin_para
	
	
Fin_Acción.
}

Program algo;
uses math, crt;
var 
	v: integer;
	i: integer;
	
	
Begin
	clrscr;

	writeln('Por favor, ingrese un valor numérico.');
	readln(v);
	
	For i:= 1 to 3 do
	begin
	
		if (i = 1) then
		begin
	 		writeln('El valor del número es ', v**i);
		end
		else
			if (i = 2) then
			begin
				writeln('El valor del número al cuadrado es ', v**i);
			end
			else
				if (i = 3) then
				begin
					writeln('El valor del número al cubo es ', v**i);	
				end;
	end;
	
	
End.


