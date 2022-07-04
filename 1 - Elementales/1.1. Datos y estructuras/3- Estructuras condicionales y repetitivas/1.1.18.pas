
{

Elabore un algoritmo que calcule el cociente de dos enteros F y G y el Resto de la operación, empleando sólo las operaciones suma y diferencia.

Acción 1118 ES;
Ambiente
	num: entero;
	den: entero;
	control_ciclo: entero;
	result: entero;
	resto: entero;
	acumulador_p_resto: entero;
	i: entero;
	
Proceso
	esc('Ingresá dos números que quieras dividir, primero el numerador y luego el denominador: ');
	leer(num);
	leer(den);
	
	control_ciclo:= 0;
	result:= 0;
	resto:= 0;
	acumulador_p_resto:= 0;
	
	Mientras (control_ciclo < num) hacer
		control_ciclo:= control_ciclo + den;		
		result:= result + 1;
		
	Fin_mientras
	
	Si (control_ciclo > num) entonces
		result:= result - 1; //porque si llegó hasta acá es porque "contó" uno de más.
	Fin_si
	
	Para i:= 1 hasta result hacer 
		acumulador_p_resto:= acumulador_p_resto + den;	
	Fin_Para
	
	resto:= num - acumulador_p_resto;
	
	esc('El resultado utilizando el operador " / " es >> ', num DIV den);
	esc('El resultado utilizando el método de suma y diferencia es >> ', result);
	esc('El resto de la división es >> ', resto);

Fin_Acción.

}

program something;
var
	num: integer;
	den: integer;
	control_ciclo: integer;
	result: integer;
	resto: integer;
	acumulador_p_resto: integer;
	i: integer;
Begin
	writeln('Ingresá dos números que quieras dividir, primero el numerador y luego el denominador: ');
	readln(num);
	readln(den);
	
	control_ciclo:= 0;
	result:= 0;
	resto:= 0;
	acumulador_p_resto:= 0;
	
	while (control_ciclo < num) do
	begin
		control_ciclo:= control_ciclo + den;		
		result:= result + 1;
		
	end;
	
	if (control_ciclo > num) then
	begin
		result:= result - 1; //porque si llegó hasta acá es porque "contó" uno de más.
	end;
	
	For i:= 1 to result do 
	begin
		acumulador_p_resto:= acumulador_p_resto + den;	
	end;
	
	resto:= num - acumulador_p_resto;
	
	writeln('El resultado utilizando el operador " / " es >> ', num DIV den);
	writeln('El resultado utilizando el método de suma y diferencia es >> ', result);
	writeln('El resto de la división es >> ', resto);

End.


