{


Escriba un algoritmo para calcular cada renglón de una factura (valor unitario * cantidad vendida) y el total de la misma, suponiendo que el número de renglones es variable. Emitir un mensaje de error si el valor unitario es <= 0. 

Realizar la prueba de escritorio con los siguientes valores: Cantidad de renglones: 4
	
	Valor Unitario 	Cantidad Vendida
		2 			10
		1 			25
		3 			15
		2 			8.5
		

// Lo que tiene que emitir el programa es lo siguiente:
		
		Valor Unitario 	Cantidad Vendida	Total
		2 			10			20
		1 			25			25
		3 			15			45
		2 			8.5			17
		
		Total General >> 107

Acción 1123 ES;
Ambiente
	total_item: real;
	total_general: real;
	valor: real;
	ventas: real;
	elementos: entero;
	i: entero;
	
Proceso
	total_item:= 0;
	total_general:= 0;
	
	esc('Ingrese cuántos elementos desee cargar: ');
	leer(elementos);
	
	Para i:= 1 hasta (elementos) hacer
		
		Repetir
			esc('Ingrese el valor unitario del elemento: ');
			leer(valor);
				Si(valor <= 0) entonces
					esc('Valor erróneo. Por favor, ingréselo nuevamente.');
				Fin_Si
		Hasta que (valor >= 0);
		
		esc('Ingrese las cantidades vendidas del elemento: ');
		leer(ventas);
		
		esc('Elemento', i, ' | Valor Unitario = ', valor, ' | Cantidad Vendida = ', ventas. ' | Total = ', valor*ventas, '$ |');
		
		total_item:= valor;
		total_general:= total_general + total_item;
	
	Fin_Para
	
	esc('El total de la facura es = ', total_general);

Fin_Acción.

}
{
		** El programa va a emitir lo siguiente **
		
		Valor Unitario 	Cantidad Vendida	Total
		2 			10			20
		1 			25			25
		3 			15			45
		2 			8.5			17
		
		Total General >> 107
}

Program facturas;
uses crt;
var
	total_item: real;
	total_general: real;
	valor: real;
	ventas: real;
	elementos: integer;
	i: integer;
	
Begin
	clrscr;
	
	total_item:= 0;
	total_general:= 0;
	
	TextColor(lightgray);
	writeln('Ingrese cuántos elementos desee cargar: ');
	readln(elementos);
	
	For i:= 1 to (elementos) do
	Begin
		Repeat
			writeln('Ingrese el valor unitario del elemento: ');
			readln(valor);
				if (valor <= 0) then
				begin
					TextColor(lightred);
					writeln('Ingesaste un valor erróneo. Por favor, ingrese nuevamente el valor unitario del elemento: ');
					TextColor(lightgray);
				end;
		Until (valor >= 0);
		
		
		writeln('Ingrese las cantidades vendidas del elemento: ');
		readln(ventas);
		
		TextColor(yellow);
		write(#13#10, 'Elemento ', i, ' | Valor Unitario = ', valor:0:2, ' | Cantidad Vendida = ', ventas:0:2, ' | Total = ', (valor*ventas):0:2, '$ |', #13#10);
		TextColor(lightgray);
		
		total_item:= valor * ventas;
		total_general:= total_general + total_item;
	
	end;
	
	TextColor(yellow);
	writeln('El total de la facura es = ', total_general:0:2, '$');

End.



