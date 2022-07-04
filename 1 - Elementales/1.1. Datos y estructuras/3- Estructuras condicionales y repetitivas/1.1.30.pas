
{
Escriba un algoritmo para resolver el siguiente problema: Una empresa de transportes desea conocer el sueldo de sus 100 choferes. Estos se calculan teniendo en cuenta la categoría (1 o 2) y la asistencia (perfecta: si o no). El sueldo se obtiene sumando el sueldo básico, más el 2% de antigüedad por cada año trabajado y $200 de premio por asistencia. El sueldo básico es de $700 para choferes de categoría 1 y de $500.- para los de categoría 2.

conocer sueldo 100 choferes

cat(1,2)

asist(perfect o no)

¿Como saco sueldo? 

sueldo básico---------> 700 cat 1 (+ 2% c/año trabajando, + 200 premio asistencia)
		---------> 500 cat 2 (+ 2% c/año trabajando, + 200 premio asistencia)
		
		
Acción 1130 ES;
Ambiente
	cat: entero;
	assist: caracter;
	ant: entero;
	sueldo: real;
	i: entero;

Proceso
	Para i:= 1 hasta 100 hacer 
		esc('Categoría >> ');
		leer(cat);
		
		esc('Asistencia completa s/n >> ');
		leer(assist);
		
		esc('Antigüedad >> ');
		leer(ant);
		
		si (cat = 1) and (assist = 's') entonces
			sueldo:= 700 + (1 + (0.02 * ant)) + 200;
		sino
			si (cat = 1) entonces
				sueldo:= 700 + (1 + (0.02 * ant));
			sino
				si (cat = 2) and (assist = 's') entonces
					sueldo:= 500 + (1 + (0.02 * ant)) + 200;
				sino
					si (cat = 2) entonces
						sueldo:= 500 + (1 + (0.02 * ant));
					fin_si
				fin_si
			fin_si
		fin_si
		
		esc('Sueldo correspondiente para el chofer ', i, ' >> ', sueldo, '$');
	Fin_Para

Fin_Acción.
}

program salarios;
var
	cat: integer;
	assist: char;
	ant: integer;
	sueldo: real;
	i: integer;
Begin
	for i:= 1 to 100 do 
	begin 
		write('Categoría >> ');
		readln(cat);
		
		write('Asistencia completa s/n >> ');
		readln(assist);
		
		write('Antigüedad >> ' );
		readln(ant);
		
		if (cat = 1) and (assist = 's') then
		begin
			sueldo:= 700 * (1 + (0.02 * ant)) + 200;
		end 
		else
			if (cat = 1) then
			begin
				sueldo:= 700 * (1 + (0.02 * ant));
			end
			else 
				if (cat = 2) and (assist = 's') then
				begin
					sueldo:= 500 * (1 + (0.02 * ant)) + 200;
				end
				else
					if (cat = 2) then
					begin
						sueldo:= 500 * (1 + (0.02 * ant));
					end;
		writeln('Sueldo correspondiente para el chofer ', i, ' >> ', sueldo:0:2, '$', #13#10);
	end;
End.	









