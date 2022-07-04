
{
Escribir un algoritmo que, dado un importe dinero, permia calcular e informar cuanto corresponde pagar por un impuesto, en cuantas cuotas y el valor de las mismas. Tener en cuenta los siguientes datos:

   1- IMPUESTO = 10% del importe dado.
   2- Los importes mayores que $500 y menor o igual que $1000 se pagan en dos cuotas.
   3- Los mayores de $1000 en tres cuotas. El algoritmo debe permitir tratar varios importes finalizando cuando se ingresa 9999 como importe.

Acción 1124 ES;
Ambiente
	money: real;
	dif_imp: real;
	tot: real;
	
	impuesto = 0.1;
	
Proceso
	esc('Ingrese un importe de dinero: ');
	leer(money);
	
	mientras (money <> 9999) hacer
		esc('Ingrese un importe de dinero: ');
		leer(money);
		
		dif_imp:= money * impuesto;
		tot:= (money * impuesto) + money;
		
		esc('El 10% del monto ingresado es >> ', dif_imp);
		esc('El total a abonar es >> ', tot);
		
		si (money > 500) and (money <= 1000) entonces
			esc('Debe abonar el valor en dos cuotas de ', tot/2);
		sino
			si (money > 1000) entonces
				esc('Debe abonar el valor en tres cuotas de ', tot/3);
			fin_si
		fin_si
		
		esc('Ingrese un importe de dinero: ');
		leer(money);
	fin_mientras
	
Fin_Acción.
}

program taxes;
const
	impuesto = 0.1;
var
	money: real;
	dif_imp: real;
	tot: real;
	
Begin
	writeln('Ingrese un importe de dinero: ');
	readln(money);
	
	while (money <> 9999) do
	begin	
		dif_imp:= money * impuesto;
		tot:= (money * impuesto) + money;
		
		writeln('El 10% del monto ingresado es >> ', dif_imp:0:2, '$');
		writeln('El total a abonar es >> ', tot:0:2, '$');
		
		if (money > 500) and (money <= 1000) then
		begin
			writeln('Debe abonar el valor en dos cuotas de ', (tot/2):0:2, '$');
		end
		else
			if (money > 1000) then
			begin
				writeln('Debe abonar el valor en tres cuotas de ', (tot/3):0:2, '$');
			end;
		
		writeln('Ingrese un importe de dinero: ');
		readln(money);
	end;
	
End.









