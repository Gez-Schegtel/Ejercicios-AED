{
Escriba un algoritmo que acepte dos números, calcule la suma e imprima el mensaje de acuerdo al resultado obtenido.

    Suma <= 50
    Suma > 50 y <= 100
    Suma > 100 y <= 200
    Suma > 200

Acción 117 ES;
Ambiente
	n1: entero;
	n2: entero;
	sum: entero;
	
Proceso 
	esc('Ingrese dos números: ');
	leer(n1);
	leer(n2);
	
	sum:= n1 + n2;
	
	Según sum hacer
		<= 50: esc('El resultado es menor o igual a 50!');
		
		> 50 and <= 100: esc('El resultado está entre el 51 y el 100!');
		
		> 100 and <= 200: esc('El resultado está situado entre el 101 y el 200!');
		
		> 200: esc('El resultado es mayor a 200!');
	Fin según
	
Fin.

Acción 117 ES;
Ambiente
	n1: entero;
	n2: entero;
	sum: entero;
	
Proceso
	esc('Ingrese dos números');
	leer(n1);
	leer(n2);
	
	sum:= n1 + n2;
	
	Si (sum <= 50) entonces
		esc('El resultado es menor o igual a 50!');
	sino
		Si (sum > 50) and (sum <= 100) entonces
			esc('El resultado está entre el 51 y el 100!');
		sino
			Si (sum > 100) and (sum <= 200) entonces
				esc('El resultado está situado entre el 101 y el 200!');
			sino
				Si (sum > 200) entonces
					esc('El resultado es mayor a 200!');
				Fin si
			Fin si
		Fin si 
	Fin si

Fin.
}

Program nums;
var
	n1: integer;
	n2: integer;
	sum: integer;
	
Begin
	writeln('Ingrese dos números: ');
	readln(n1);
	readln(n2);
	
	sum:= n1 + n2;
	
	if (sum <= 50) then
	begin
		writeln('El resultado es menor o igual a 50!');
	end
	else
		if (sum <= 100) then
		begin
			writeln('El resultado está entre el 51 y el 100!');
		end
		else
			if (sum <= 200) then
			begin
				writeln('El resultado está situado entre el 101 y el 200!');
			end
			else
				writeln('El resultado es mayor a 200!');
End.

{
================
Versión mejorada:


Acción 117 ES;
Ambiente
	n1: entero;
	n2: entero;
	sum: entero;
	
Proceso
	esc('Ingrese dos valores');
	leer(n1);
	leer(n2);
	
	sum:= n1 + n2;
	
	según sum hacer
		 <= 50: esc('El resultado es menor o igual a 50!', sum);
		<= 100: esc('El resultado está comprendido entre 50 y 100!', sum);
		<= 200: esc('El resultado está comprendido entre 100 y 200!', sum);
		 > 200: esc('El resultado es mayor a 200!', sum);
	fin_según
	
Fin_Acción.
}


















