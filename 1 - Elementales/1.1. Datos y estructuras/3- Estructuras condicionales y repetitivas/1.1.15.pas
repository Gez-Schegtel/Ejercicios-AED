    
{

    1- Hacer un algoritmo que calcule la altura aproximada de un edificio en pies, ingresando como dato la cantidad de pisos del mismo y la altura promedio de cada piso, en metros. (1 m 		= 3.28 pies)
    
    2- Modifique el algoritmo del punto 1. para que permita calcular la altura de 50 edificios.
    
    3- Modifique el algoritmo del punto 1. para que permita calcular la altura de una cantidad indeterminada de edificios. Prevea una condición de fin.


Acción 115-1 ES;
Ambiente
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;

Proceso
	esc('Ingrese la cantidad de pisos del edificio, en metros: ');
	leer(pisos_m);	
	esc('Ingrese la altura promedio de los pisos, en metros: ');
	leer(prom_m);
	
	altura_m:= pisos_m * altura_m;
	
	altura_p:= altura_m * 3.28;
	
	esc('La altura del edificio en pies es >> ', altura_p)

Fin_Acción


Acción 115-2 ES;
Ambiente
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;
	cont: entero;
	i: entero;

Proceso
	cont:= 0;
	
	Para i:= 1 hasta 50 hacer
		esc('Ingrese la cantidad de pisos del edificio, en metros: ');
		leer(pisos_m);	
		esc('Ingrese la altura promedio de los pisos, en metros: ');
		leer(prom_m);
		
		altura_m:= pisos_m * altura_m;
		
		altura_p:= altura_m * 3.28;
		
		cont:= cont + 1;
		
		esc('La altura del edificio', cont, ' en pies es >> ', altura_p);
	Fin_Para.
Fin_Acción

Acción 115-3 ES;
Ambiente
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;
	cont: entero;
	i: entero;
	op: entero;

Proceso
	cont:= 0;
	
	esc('Ingrese la cantidad de edificios que desee evaluar.');
	leer(op);
	
	Para i:= 1 hasta op hacer
		esc('Ingrese la cantidad de pisos del edificio, en metros: ');
		leer(pisos_m);	
		esc('Ingrese la altura promedio de los pisos, en metros: ');
		leer(prom_m);
		
		altura_m:= pisos_m * altura_m;
		
		altura_p:= altura_m * 3.28;
		
		cont:= cont + 1;
		
		esc('La altura del edificio', cont, ' en pies es >> ', altura_p);
	Fin_Para.
Fin_Acción


program uno;
var
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;

Begin
	writeln('Ingrese la cantidad de pisos del edificio: ');
	readln(pisos_m);	
	writeln('Ingrese la altura promedio de los pisos, en metros: ');
	readln(prom_m);
	
	altura_m:= pisos_m * prom_m;
	
	altura_p:= altura_m * 3.28;
	
	writeln('La altura del edificio en pies es >> ', altura_p:0:2);

End.


program dos;
var
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;
	cont: integer;
	i: integer;

Begin
	cont:= 0;
	
	For i:= 1 to 50 do
	begin
		writeln('Ingrese la cantidad de pisos del edificio: ');
		readln(pisos_m);	
		writeln('Ingrese la altura promedio de los pisos, en metros: ');
		readln(prom_m);
		
		altura_m:= pisos_m * prom_m;
		
		altura_p:= altura_m * 3.28;
		
		cont:= cont + 1;
		
		writeln('La altura del edificio ', cont, ' en pies es >> ', altura_p:0:2);
	end

End.
}

program tres;
var
	pisos_m: real;
	prom_m: real;
	altura_m: real;
	altura_p: real;
	cont: integer;
	i: integer;
	op: integer;

Begin
	cont:= 0;
	
	writeln('Ingrese la cantidad de edificios que desee evaluar: ');
	readln(op);
	
	For i:= 1 to (op) do
	begin
		writeln('Ingrese la cantidad de pisos del edificio: ');
		readln(pisos_m);	
		writeln('Ingrese la altura promedio de los pisos, en metros: ');
		readln(prom_m);
		
		altura_m:= pisos_m * prom_m;
		
		altura_p:= altura_m * 3.28;
		
		cont:= cont + 1;
		
		writeln('La altura del edificio ', cont, ' en pies es >> ', altura_p:0:2,'ft');
	end

End.



