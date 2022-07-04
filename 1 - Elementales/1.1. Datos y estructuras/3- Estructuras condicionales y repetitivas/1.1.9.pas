{
Una persona decide realizar un viaje a Europa, para lo cual necesita una determinada cantidad de euros. La persona tiene ahorrada una cierta suma en dólares y desea saber si es suficiente y, en caso de haber diferencia (de más o de menos) a cuantos pesos equivale. 

Realice un algoritmo que solucione el problema, para lo cual deberá prever que se ingresen las equivalencias de monedas que considere necesarias (por ejemplo la cotizacion en pesos de dólar y/o del euro, o a cuantos euros equivale un dólar).

Acción 119 ES;
Ambiente
	usd: real;
	ars: real;
	ars2eur: real;
	ars2usd: real;
	diff_1: real;
	diff_2: real;
	diff_tot: real;
	
Proceso
	esc('Ingrese cuántos pesos argentinos equivale un dólar: ');
	leer(ars2usd);
	
	esc('Ahora, cuántos pesos argentinos equivalen a un euro: ');
	leer(ars2eur);

	esc('Ingrese la cantidad de dinero que necesita para su viaje, en euros: ');
	leer(eur);
	
	esc('Ingrese la cantidad de dinero que posee en dólares: ');
	leer(usd);
	
	// ** Ayuda de cálculo para realizar el algoritmo. 
	1usd --- 30ars
	
	4usd --- 120ars
	
	
	1eur --- 45ars
	
	6eur --- 270ars

	diff_1:= eur * ars2eur;
	
	diff_2:= usd * ars2usd;
	
	diff_tot:= diff_1 - diff_2;
	
	si (diff_tot < 0) entonces
		esc('Te faltan ', diff_tot, 'ars para realizar el viaje');
	sino
		esc('Te sobran ', diff_tot, 'ars para disfrutar en el viaje!!');
	fin_si
	
	 		
Fin_acción.
}

Program travel;
var 
	usd: real;
	eur: real;
	ars2eur: real;
	ars2usd: real;
	diff_1: real;
	diff_2: real;
	diff_tot: real;
	
Begin
	writeln('Ingrese cuántos pesos argentinos equivale un dólar: ');
	readln(ars2usd);
	
	writeln('Ahora, cuántos pesos argentinos equivalen a un euro: ');
	readln(ars2eur);

	writeln('Ingrese la cantidad de dinero que necesita para su viaje, en euros: ');
	readln(eur);
	
	writeln('Ingrese la cantidad de dinero que posee en dólares: ');
	readln(usd);
	
	{ ** Ayuda de cálculo para realizar el algoritmo. 
	1usd --- 30ars
	
	4usd --- 120ars
	
	
	1eur --- 45ars
	
	6eur --- 270ars
	}
	
	diff_1:= eur * ars2eur;
	
	diff_2:= usd * ars2usd;
	
	diff_tot:= diff_1 - diff_2;
	
	if (diff_tot > 0) then 
	begin
		writeln('Te faltan ', diff_tot:0:2, 'ars para realizar el viaje');
	end
	else
		begin
			writeln('Te sobran ', diff_tot:0:2, 'ars para disfrutar en el viaje!!');
		end;
		
End.









