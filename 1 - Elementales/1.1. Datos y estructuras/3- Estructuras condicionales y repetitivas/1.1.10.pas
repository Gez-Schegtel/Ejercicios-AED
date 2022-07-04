
{
Dados dos números enteros A y B generar un algoritmo que permita determinar si A es divisor de B o B es divisor de A.

Acción 110 ES;
Ambiente
	n1: entero;
	n2: entero;
	es_div1: entero;
	es_div2: entero;
	cont: entero;

Proceso
	cont:= 0;
	esc('Ingresar dos números a continuación: ');
	leer(n1);
	leer(n2);
	
	es_div1:= n1 mod n2;
	
	si (es_div1 = 0) entonces
		esc('El número ', n1, ' es divisor de ', n2);
	sino
		esc('El número ', n1, ' no es divisor de ', n2);
		cont:= cont + 1;
	fin_si
	
	es_div2:= n2 mod n1;
	
	si (es_div2 = 0) entonces
		esc('El número ', n2, ' es divisor de ', n1);
	sino
		esc('El número ', n2, ' no es divisor de ', n1);
		cont:= cont + 1;
	fin_si	
	
	si (cont = 2) entonces
		esc('Los números que ingresaste no son divisores entre sí de ninguna forma!!');
	fin_si
	
Fin_acción
}


Program divs;
var
	n1: integer;
	n2: integer;
	es_div1: integer;
	es_div2: integer;
	cont: integer;

Begin
	cont:= 0;
	writeln('Ingresar dos números a continuación: ');
	readln(n1);
	readln(n2);
	
	//**Cálculos
	es_div1:= n1 mod n2;
	es_div2:= n2 mod n1;
	
	//**Comparaciones
	if (es_div1 = 0) then
	begin
		writeln('El número ', n1, ' es divisor de ', n2);
	end
	else
	begin 
		writeln('El número ', n1, ' no es divisor de ', n2);
			cont:= cont + 1;
		end;		
	
	if (es_div2 = 0) then
	begin
		writeln('El número ', n2, ' es divisor de ', n1);
	end
	else
	begin
		writeln('El número ', n2, ' no es divisor de ', n1);
			cont:= cont + 1;
		end;
	
	if (cont = 2) then
	begin
		writeln('Los números que ingresaste no son divisores de ninguna forma!!!');
	end;	
End.











