{
Dado un año ingresado por el usuario, emitir el mensaje 'ACTUAL' si corresponde al año en curso, 'PASADO' si es menor y 'FUTURO' si es mayor.

Acción 111 ES;
Ambiente
	a_a: entero;
	a_m: entero;
	a_d: entero;
	c_a: entero;
	c_m: entero;
	c_d: entero;
	comp1: entero;
	comp2: entero;
	comp3: entero;

Proceso
	esc('Ingrese el año en curso, en formato dd/mm/aaaa: ');
	leer(a_d);
	leer(a_m);
	leer(a_a);
	
	esc('Ingrese un año con el que desee realizar la comparación, en el mismo formato: ');
	leer(c_d);
	leer(c_m);
	leer(c_a);
	
	comp1:= c_a - a_a;
	comp2:= c_m - a_m;   
	comp3:= c_d - a_d;
	
	si (comp1 > 0) entonces
		esc('Pasado');
	sino
		si (comp1 < 0) entonces
			esc('Futuro');
		sino
			si (comp2 > 0) entonces
				esc('Pasado');
			sino
				si (comp2 < 0) entonces
					esc('Futuro');
				sino
					si (comp3 > 0) entonces
						esc('Pasado');
					sino
						si (comp3 < 0) entonces
							esc('Futuro');
						sino
							esc('Actual');
						fin_si
					fin_si
				fin_si
			fin_si
		fin_si
	fin_si
	
Fin_Acción.
}


Program days;
var
	a_a: integer;
	a_m: integer;
	a_d: integer;
	c_a: integer;
	c_m: integer;
	c_d: integer;
	comp1: integer;
	comp2: integer;
	comp3: integer;

Begin
	writeln('Ingrese el año en curso, en formato dd/mm/aaaa: ');
	readln(a_d);
	readln(a_m);
	readln(a_a);
	
	writeln('Ingrese un año con el que desee realizar la comparación, en el mismo formato: ');
	readln(c_d);
	readln(c_m);
	readln(c_a);
	
	comp1:= c_a - a_a;
	comp2:= c_m - a_m;   
	comp3:= c_d - a_d;
	
	if (comp1 > 0) then
	begin
		writeln('Futuro');
	end
	else
		if (comp1 < 0) then
		begin
			writeln('Pasado');
		end
		else
			if (comp2 > 0) then
			begin
				writeln('Futuro');
			end
			else
				if (comp2 < 0) then
				begin
					writeln('Pasado');
				end
				else
					if (comp3 > 0) then
					begin
						writeln('Futuro');
					end
					else
						if (comp3 < 0) then
						begin
							writeln('Pasado');
						end
						else
							writeln('Actual');
						
End.































