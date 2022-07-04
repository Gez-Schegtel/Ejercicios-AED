
{Escriba un algoritmo que acepte un número entero mayor a 100 y menor a 1000, y muestre como está compuesto (unidades, decenas y centenas) y si es múltiplo de 3 (Recordar: todo número cuya suma de sus dígitos sea múltiplo de 3, lo es también).}

Program numdescomp;
var
	num: integer;
	unidad: integer;
	decena: integer;
	centena: integer;
	mult: integer;
	
Begin
	writeln('Ingrese un número comprendido entre 101 y 999: ');
	readln(num);
	
	unidad:= num mod 10;
	
	decena:= (num mod 100) - unidad;
	
	centena:= num - decena - unidad;
	
	//mult:= (unidad + decena + centena) mod 3; ==> para cumplir con la consigna que nombra la propiedad
	
	mult:= num mod 3;
	
	writeln('La unidad es >> ', unidad);
	
	writeln('La decena es >> ', decena);
	
	writeln('La centena es >> ', centena);
	
	if (mult = 0) then
	begin
		writeln('El número es múltiplo de 3!!');
	end
	else
		writeln('El número no es múltiplo de 3 "( ')
	
End.
