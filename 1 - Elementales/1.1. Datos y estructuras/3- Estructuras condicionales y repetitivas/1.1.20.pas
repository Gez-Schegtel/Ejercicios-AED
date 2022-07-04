{
Teniendo en cuenta el ejercicio anterior, realizar un incremento de la variable V en forma constante y creciente recalculando los demás valores 10 veces. Por ejemplo

V=2

   V    V2    V3  
   2     4     8
   3     9    27
....  ....  ....
  12   144  1728




{

Acción 1120 ES;
Ambiente
	v: entero;
	i: entero;
	x: entero;
		
Proceso
	esc('Por favor, ingrese un valor numérico.');
	leer(v);
	
	Para x:= 0 hasta 10 hacer
		
		Para i:= 1 hasta 3 hacer

			Según i hacer
				1: writeln('El valor del número es ', v**i);
				2: writeln('El valor del número al cuadrado es ', v**i);
				3: writeln('El valor del número al cubo es ', v**i, #13#10); 
			Fin_Según

		Fin_Para
		v:= v + 1;
		
	Fin_Para

Fin_Acción.


// Otra versión, pero hecha con un post-test //

Program algo;
uses math, crt;
var 
	v: integer;
	i: integer;
	d: integer;
  
Begin
	clrscr;
	d:= 0;
	
	writeln('Por favor, ingrese un valor numérico.');
	readln(v);

	repeat
	  
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
  		
  		v:= v + 1;
  		d:= d + 1;
	until (d = 11);
    
End.

}

Program algo;
uses math, crt;
var 
	v: integer;
	i: integer;
	x: integer;
		
Begin
	clrscr;

	writeln('Por favor, ingrese un valor numérico.');
	readln(v);
	write(#13#10); //#13#10 es una manera más canchera de poner un salto de línea
	
	For x:= 0 to 10 do
	begin
		For i:= 1 to 3 do
		begin
			Case i of
				1: writeln('El valor del número es ', v**i);
				2: writeln('El valor del número al cuadrado es ', v**i);
				3: writeln('El valor del número al cubo es ', v**i, #13#10); 
			end;

		end;
	
	v:= v + 1;
	end;

End.






















