
{

//** ESTE EJERCICIO NO ESTÁ MUY BIEN **//

En un experimento se obtuvieron un conjunto de pares de valores (S, V) y se requiere que desarrolle un programa que determine e imprima:

    1- Cuantos pares (S, V) tienen el mismo valor de S que el primer par (S, V) de la lista.
    2- Primer valor de S mayor que V
    3- En cuantos pares (S, V) se cumple que S es el doble de V
    4- Producto de los valores de S no nulos, donde V es nulo


Acción 114 ES;
Ambiente
	s: entero;
	v: entero;
	cont: entero;
	cont_de_s: entero;
	cont_de_dobles: entero;
	cont_1_vez: entero;
	res_s: entero;
	op: ('s', 'n');

Proceso
	cont:= 0;
	cont_de_s:= 0;
	cont_1_vez:= 0;
	cont_de_dobles:= 0;
	
	esc('¿Desea inciar el programa? s/n');
	leer(op);
	
	Mientras (op = 's') hacer
		esc('Ingrese dos números.');
		leer(s);
		leer(v);
	
		cont:= cont + 1;
		
		si (cont = 1) entonces
			res_s:= s;
		fin si
		
		// consigna 1
		si (cont > 1) & (s = res_s) entonces
			cont_de_s:= cont_de_s + 1;
		fin si 
		
		// consigna 2
		si (s > v) & (cont_1_vez = 0) entonces
			cont_1_vez:= 1; 
			esc('El primer número mayor que "v" es ', s);
		fin si 
		
		// consigna 3
		si ((s * 2) = v) entonces
			cont_de_dobles:= cont_de_dobles + 1;
		fin si
		
		si (s <> 0) & (v = 0) entonces
			esc('El con valores de s no nulos es >> ', s, v);
		fin si
		
		esc('¿Desea ingresar otro par? s/n');
		leer(op);
	FM
	
	
Fin_acción.
}

Program pares;
var
	s: integer;
	v: integer;
	cont: integer;
	cont_de_s: integer;
	cont_de_dobles: integer;
	cont_1_vez: integer;
	res_s: integer;
	op: char;

Begin
	cont:= 0;
	cont_de_s:= 0;
	cont_1_vez:= 0;
	cont_de_dobles:= 0;
	res_s:= 0;
	
	writeln('¿Desea inciar el programa? s/n');
	readln(op);
	
	while (op = 's') do
	begin
		writeln('Ingrese dos números.');
		readln(s);
		readln(v);
	
		cont:= cont + 1;
		
		if (cont = 1) then
		begin
			res_s:= s;
		end;
		
		// consigna 1
		if (cont > 1) and (s = res_s) then
		begin
			cont_de_s:= cont_de_s + 1;
		end;
		
		// consigna 2
		if (s > v) and (cont_1_vez = 0) then
		begin
			cont_1_vez:= 1; 
			writeln('El primer número mayor que "v" es ', s);
		end
		else
			writeln('No se cumplió la consigna 2 todavía.');
		
		// consigna 3
		if ((s * 2) = v) then
		begin
			cont_de_dobles:= cont_de_dobles + 1;
		end
		else
			writeln('No se cumplió la consigna 3 todavía.');
		
		// consigna 4
		if (s <> 0) and (v = 0) then
		begin
			writeln('El par de valores de s no nulos es >> ', s, ' ', v);
		end
		else
			writeln('No se cumplió la consigna 4 todavía.');
		
		writeln('¿Desea ingresar otro par? s/n');
		readln(op);
	end;
	
	writeln('Los pares que tienen el mismo valor del primer número que el primer par ingresado es >> ', cont);
	writeln('El primer número mayor que "v" es >> ', s);
	writeln('Los pares que cumplen que s es el doble de v son >> ', cont_de_dobles);
	
End.



