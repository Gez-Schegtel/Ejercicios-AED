

{
Escribir una función que lea desde el teclado las unidades y el precio que quiere comprar, y en función de las unidades introducidas le haga un descuento o no (cuando las unidades excedan media docena se aplicará 4% y el 10% cuando excedan la docena).

Acción 1212 ES;
Ambiente
	precio: real;
	kant: entero;
	
	función compra(P: real; K: entero): real ES;
		
		si (K > 6) and (K <= 12) entonces
			compra:= P * K - ((P * K) * 0.04); 
		sino
			si (K > 12) entonces
				compra:= P * K - ((P * K) * 0.10); 
			sino
				compra:= P * K;
			fin_si
		fin_si
		
	fin_función. 

Proceso
	esc('Ingrese el precio y las unidades del producto que desee adquirir: ');
	leer(precio); 
	leer(kant);
	
	esc('El precio total a abonar es >> ', compra(precio, kant):0:2, '$');
Fin_Acción	



program something;
var
	precio: real;
	kant: integer;
	
	function compra(P: real; K: integer): real;
	begin
		if (K > 6) and (K <= 12) then
		begin
			compra:= P * K - ((P * K) * 0.04); 
		end
		else
			if (K > 12) then
			begin
				compra:= P * K - ((P * K) * 0.10); 
			end
			else
				begin
					compra:= P * K;
				end; 
	end; 
Begin
	writeln('Ingrese el precio y las unidades del producto que desee adquirir: ');
	readln(precio); 
	readln(kant);
	
	writeln('El precio total a abonar es >> ', compra(precio, kant):0:2, '$');
End.

}


// versión mejorada

program something;
var
	precio: real;
	kant: integer;
	band: integer;
	
	function compra(P: real; K: integer): real;
	begin
		band:= 0;
		
		if (K > 6) and (K <= 12) then
		begin
			compra:= P * K - ((P * K) * 0.04);
			band:= 4; 
		end
		else
			if (K > 12) then
			begin
				compra:= P * K - ((P * K) * 0.10); 
				band:= 10;
			end
			else
				begin
					compra:= P * K;
				end; 
	end; 
	
	procedure verif_desc;
	begin
		if (band = 4) then
		begin
			writeln('Se aplicó un descuento del 4% !');
		end
		else
			if (band = 10) then
			begin
				writeln('Se aplicó un descuento del 10% !');
			end
			else
				writeln('No se aplicaron descuentos.');
		
	end;
	
Begin
	writeln('Ingrese el precio y las unidades del producto que desee adquirir: ');
	readln(precio); 
	readln(kant);
	
	writeln('El precio total a abonar es >> ', compra(precio, kant):0:2, '$');
	verif_desc;
	
End.


























