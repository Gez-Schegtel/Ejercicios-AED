
{
Escribir una función que lea desde el teclado las unidades y el precio de un producto que se quiere comprar, y en función de las unidades introducidas calcule un descuento o no, según corresponda: cuando las unidades excedan media docena se aplicará 4% y el 10% cuando excedan la docena. La función debe devolver como resultado el valor del descuento o cero, en caso de que no corresponda.

+6 ===> 4%off
+12 ==> 10%off

¿Cuánto de descuento le aplicamos? 

Acción 126 ES;
Ambiente
	precio: real;
	unidades: real;
	
	función desc(P, U: real): real ES;
	// no se necesitan variables locales.
	proceso
		si (U > 6) and (U <= 12) entonces
			desc:= (P * U) * 0.04;
		sino
			si (U > 12) entonces
				desc:= (P * U) * 0.10;
			sino
				desc:= 0;
			fin_si
		fin_si
		
	fin_función
	
Proceso
	esc('Ingrese el precio del produco: ');
	leer(precio);
	esc('Ingrese cuántas unidades del producto serán adquiridas: ');
	leer(unidades);
	
	esc('Descuento aplicable >> ', desc(precio, unidades), '$');
Fin_Acción.
}

program descuento;
var
	precio: real;
	unidades: integer;
	op: char;
	
	function desc(P: real; U: integer): real;
	// no need for locar vars.
	begin
		if (U > 6) and (U <= 12) then
		begin
			desc:= (P * U) * 0.04;
		end
		else
			if (U > 12) then
			begin
				desc:= (P * U) * 0.10;
			end
			else
				desc:= 0;
		
	end;
	
Begin
	writeln('¿Desea iniciar el proceso? s/n');
	readln(op);
	
	while (op = 's') do 
	begin
		writeln('Ingrese el precio del produco: ');
		readln(precio);
		writeln('Ingrese cuántas unidades del producto serán adquiridas: ');
		readln(unidades);
		
		writeln('Descuento aplicable >> ', desc(precio, unidades):0:2, '$');
		writeln('Precio a pagar >> ', ((precio * unidades) - desc(precio, unidades)):0:2, '$');
		
		writeln('¿Desea evaluar otra compra? s/n');
		readln(op);
	end;
End.










