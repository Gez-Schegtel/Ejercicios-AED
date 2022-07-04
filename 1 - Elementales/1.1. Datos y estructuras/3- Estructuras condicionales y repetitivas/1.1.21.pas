
{
Repita el ejercicio anterior con un cálculo de n veces, con n > 1. Por final emitir la suma de los cuadrados de V.

Acción 1120 ES;
Ambiente
	v: entero;
	i: entero;
	x: entero;
	n: entero;
	res_v: entero;
		
Proceso
	esc('Por favor, ingrese un valor numérico.');
	leer(v);
	
	esc('Ingrese con cuantos valores a partir del ingresado desea realizar operación.');
	leer(n);
	
	res_v:= 0;
	
	Para x:= 0 hasta n hacer
		
		Para i:= 1 hasta 3 hacer

			Según i hacer
				1: writeln('El valor del número es ', v**i);
				2: writeln('El valor del número al cuadrado es ', v**i);
				   res_v:= res_v + (v**i);
				3: writeln('El valor del número al cubo es ', v**i, #13#10); 
			Fin_Según

		Fin_Para
		v:= v + 1;
		
	Fin_Para
	
		esc('El valor de la suma de todos los cuadrados obtenidos es >> ', res_v);
Fin_Acción.
}

Program algo;
uses math, crt;
var 
	v: integer;
	i: integer;
	x: integer;
	n: integer;
	res_v: integer;
		
Begin
	clrscr;

	writeln('Por favor, ingrese un valor numérico.');
	readln(v);
	write(#13#10); //#13#10 es una manera más canchera de poner un salto de línea
	
	writeln('Ingrese con cuantos valores a partir del ingresado desea realizar operación.');
	readln(n);
	
	res_v:= 0;
	
	For x:= 0 to n do
	begin
		For i:= 1 to 3 do
		begin
			Case i of
				1: writeln('El valor del número es ', v**i);
				2: begin 
					writeln('El valor del número al cuadrado es ', v**i); 
					res_v:= res_v + (v**i);
				   end;
				3: writeln('El valor del número al cubo es ', v**i, #13#10); 
			end;

		end;
	
	v:= v + 1;
	end;
	
	writeln('El valor de la suma de todos los cuadrados obtenidos es >> ', res_v);

End.

