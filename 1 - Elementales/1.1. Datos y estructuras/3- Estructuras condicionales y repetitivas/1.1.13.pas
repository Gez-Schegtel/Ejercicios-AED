
{
Escriba un algoritmo que acepte un número entero mayor a 100 y menor a 1000 que representa una suma de dinero e indique cuantos billetes de cada denominación necesita, suponiendo que solo existen billetes de 100, 10 y 1 peso.


Acción dinero ES;
Ambiente
	num: entero;
	unidad: entero;
	decena: entero;
	centena: entero;
	cont1: entero;
	cont2: entero;
	cont3: entero;
	
Proceso
	cont1:= 0;
	cont2:= 0;
	cont3:= 0;	
	
	esc('Indique la cantidad de dinero que posee (número entre 100 y 999): ');
	leer(num);
	
	
	// ** Descomposición del número ** //
	
	unidad:= num mod 10;
	
	decena:= (num mod 100) - unidad;
	
	centena:= num - decena - unidad;
	
	
	mientras (cont1 < unidad) hacer
		cont1:= cont1 + 1;
	fm
	
	mientras (cont2 < decena) hacer
		cont2:= cont2 + 10;
	fm
		cont2:= cont2 div 10
	
	
	mientras (cont3 < centena) hacer
		cont3:= cont3 + 100;
	fm
		 cont3:= cont3 div 100
	
	
	esc('Necesita ', cont1, ' billetes de un 1 peso ');
	esc('Necesita ', cont2, ' billetes de 10 pesos ');
	esc('Necesita ', cont3, ' billetes de 100 pesos ');
	
Fin_Acción.
}
{
Program dinero;
var
	num: integer;
	unidad: integer;
	decena: integer;
	centena: integer;
	cont1: integer;
	cont2: integer;
	cont3: integer;
	
Begin
	cont1:= 0;
	cont2:= 0;
	cont3:= 0;	
	
	writeln('Indique la cantidad de dinero que posee (número entre 100 y 999): ');
	readln(num);
	
	
	// ** Descomposición del número ** //
	
	unidad:= num mod 10;
	
	decena:= (num mod 100) - unidad;
	
	centena:= num - decena - unidad;
	
	
	while (cont1 < unidad) do
	begin
		cont1:= cont1 + 1;
	end;
	
	while (cont2 < decena) do
	begin
		cont2:= cont2 + 10;
	end;
		cont2:= cont2 div 10;
		
	
	while (cont3 < centena) do
	begin
		cont3:= cont3 + 100;
	end;
		cont3:= cont3 div 100;
	
	
	writeln('Necesita ', cont1, ' billetes de un 1 peso ');
	writeln('Necesita ', cont2, ' billetes de 10 pesos ');
	writeln('Necesita ', cont3, ' billetes de 100 pesos ');
	
End.
}

{

//** Versión mejorada **//

Acción dinero ES
Ambiente
	un: entero
	de: entero
	ce: entero
	num: entero
	
Proceso
	esc('Indique la cantidad de dinero que posee (número mayor a 100 y menor a 1000): ')
	leer(num)
	
	// ** Descomposición del número ** //
	
	un:= num mod 10
	de:= (num div 10) mod 10
	ce:= num div 100

	esc('Necesita ', un, ' billetes de 1 peso.')
	esc('Necesita ', de, ' billetes de 10 pesos.')
	esc('Necesita ', ce, ' billetes de 100 pesos.')
	
Fin_Acción.
}

program better_vers;
var 
	un: integer;
	de: integer;
	ce: integer;
	num: integer;

Begin
	writeln('Ingrese el dinero que posea (se permite una cifra de tres dígitos.): ');
	readln(num);
	
	//** Descomposición del número **//
	
	un:= num mod 10;
	de:= (num div 10) mod 10;
	ce:= num div 100;
	
	writeln('Necesita ', un, ' billetes de 1 peso.');
	writeln('Necesita ', de, ' billetes de 10 pesos.');
	writeln('Necesita ', ce, ' billetes de 100 pesos.')

End.

































