
{
Escriba un algoritmo que acepte un número entero que representa una suma de dinero e indique cuantos billetes de cada denominación necesita, suponiendo que solo existen billetes de 500, 100, 50, 20, 10, 5 y 1 peso.


Creo que hay muchas combinaciones posibles, así que lo resolví a mí manera.

Acción 1135 ES;
Ambiente
	num: entero;
	pas1: entero;
	cont: entero;
	
Proceso
	esc('Ingrese un número: ');
	leer(num);
	
	cont:= 0;
	mientras (num <> 0) hacer
		
		pas1:= num mod 10;
		num:= num div 10;
		cont:= cont + 1;
		
		según (cont) hacer
			1:	esc('Se necesitan ', pas1, ' billetes de 1 peso.'); 
			2:	esc('Se necesitan ', pas1*2, ' billetes de 5 pesos, o ', pas1, ' de 10 pesos.');
			3: 	esc('Se necesitan ', pas1*5, ' billetes de 20 pesos, o ', pas1*2, ' de 50 pesos.');
			4: 	esc('Se necesitan ', pas1*10, ' billetes de 100 pesos.');
			5: 	esc('Se necesitan ', pas1*20, ' billetes de 500 pesos.');
		fin_según
	
	fin_mientras

Fin_Acción.

}

program descomp;
var 
	num: integer;
	pas1: integer;
	cont: integer;
	
Begin
	writeln('Ingrese un número: ');
	readln(num);
	
	cont:= 0;
	while (num <> 0) do
	begin
		pas1:= num mod 10;
		num:= num div 10;
		cont:= cont + 1;
		
		case (cont) of
			1:	writeln('Se necesitan ', pas1, ' billetes de 1 peso.'); 
			2:	writeln('Se necesitan ', pas1*2, ' billetes de 5 pesos, o ', pas1, ' de 10 pesos.');
			3: 	writeln('Se necesitan ', pas1*5, ' billetes de 20 pesos, o ', pas1*2, ' de 50 pesos.');
			4: 	writeln('Se necesitan ', pas1*10, ' billetes de 100 pesos.');
			5: 	writeln('Se necesitan ', pas1*20, ' billetes de 500 pesos.');
		end;
	end;
End.
