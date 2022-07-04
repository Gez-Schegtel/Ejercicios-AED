
{
La fecha del domingo de Pascua corresponde al primer domingo después de la primera luna llena que sigue al equinoccio de primavera. La secuencia de cálculos que permite conocer esta fecha es:

	A = anio mod 19
	B = anio mod 4
	C = anio mod 7
	D = ( 19 * A + 24 ) mod 30 
	E = ( 2 * B + 4 * C + 6 * D + 5 ) mod 7
	N = ( 22 + D + E )

Donde N indica el número del día del mes de marzo (o abril si N es superior a 31) correpondiente al domingo de Pascua. Realizar un algoritmo que determine esta fecha para los años comprendidos entre 1990 y 2010

Acción 1132 ES;
Ambiente
	A: entero;
	B: entero;
	C: entero;
	D: entero;
	E: entero;
	N: entero;
	jahr: entero;
	
Proceso
	para jahr:= 1990 hasta 2010 hacer 
		A:= jahr mod 19;
		B:= jahr mod 4;
		C:= jahr mod 7;
		D:= ( 19 * A + 24 ) mod 30;
		E:= ( 2 * B + 4 * C + 6 * D + 5 ) mod 7;
		N:= ( 22 + D + E ); //número del día del mes de marzo (o abril si es > 31)
	
		si (N <= 31) entonces
			esc('La fecha del domingo de Pascuas del año ', jahr, ' es ', N, ' de Marzo.');
		sino
			N:= N - 31; 
			esc('La fecha del domingo de Pascuas del año ', jahr, ' es ', N, ' de Abril.');
	fin_para
	
Fin_Acción.
}

program pascuas;
var
	A: integer;
	B: integer;
	C: integer;
	D: integer;
	E: integer;
	N: integer;
	jahr : integer;
	
Begin
	for jahr:= 1990 to 2050 do //modifiqué la fecha para jugar un rato (y para que me sirva el código desde ahora en adelante xD)
	begin  
		A:= jahr mod 19;
		B:= jahr mod 4;
		C:= jahr mod 7;
		D:= ( 19 * A + 24 ) mod 30;
		E:= ( 2 * B + 4 * C + 6 * D + 5 ) mod 7;
		N:= ( 22 + D + E ); //número del día del mes de marzo (o abril si es > 31)
	
		if (N <= 31) then
		begin
			writeln('La fecha del domingo de Pascuas del año ', jahr, ' es ', N, ' de Marzo.');
		end
		else
			begin
				N:= N - 31; 
				writeln('La fecha del domingo de Pascuas del año ', jahr, ' es ', N, ' de Abril.');
			end;
	end;
	
End.


