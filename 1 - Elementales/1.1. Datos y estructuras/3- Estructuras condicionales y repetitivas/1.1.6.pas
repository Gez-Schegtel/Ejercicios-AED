
{
Escriba un algoritmo que permita ingresar 3 valores numéricos y determine cuál es el mayor, el medio y el menor. (era el 3 de los complementarios)

Acción 116 ES;
Ambiente
	n1: entero;
	n2: entero;
	n3: entero;
	
Proceso
	esc('Ingrese tres números.');
	leer(n1);
	leer(n2);
	leer(n3);
	
	si (n1 < n2) and (n1 < n3) entonces
		
		si (n2 < n3) entonces
			esc('Núm mayor: ', n3);
			esc('Núm medio: ', n2);
			esc('Núm menor: ', n1);
		sino
			si (n2 > n3) entonces
				esc('Núm mayor: ', n2);
				esc('Núm medio: ', n3);
				esc('Núm menor: ', n1);
			fin si				
		fin si	
	
	sino
	
		si (n1 < n2) and (n1 > n3) entonces
			esc('Núm mayor: ', n2);
			esc('Núm medio: ', n1);
			esc('Núm menor: ', n3);			
		fin si
	
	sino
	
		si (n1 > n2) and (n1 > n3) entonces
			si (n2 < n3) entonces
				esc('Núm mayor: ', n1);
				esc('Núm medio: ', n3);
				esc('Núm menor: ', n2);
			sino
				si (n2 > n3) entonces
					esc('Núm mayor: ', n1);
					esc('Núm medio: ', n2);
					esc('Núm menor: ', n3);
				fin si
			fin si 
		fin si
	
	sino
		si (n1 > n2) and (n1 < n3) entonces
			esc('Núm mayor: ', n3);
			esc('Núm medio: ', n1);
			esc('Núm menor: ', n2);
		fin si
	sino
		esc('Ingresaste números iguales. No se puede realizar la comparación.');
	
	fin si
	
Fin.
}

Program threenumbs;
var
	n1: integer;
	n2: integer;
	n3: integer;

Begin
	writeln('Ingrese tres números: ');
	readln(n1);
	readln(n2);
	readln(n3);
	
	if (n1 < n2) and (n1 < n3) then
	begin
		if (n2 < n3) then
		begin
			writeln('Núm mayor: ', n3);
			writeln('Núm medio: ', n2);
			writeln('Núm menor: ', n1);
		end
		else
			if (n2 > n3) then
			begin
				writeln('Núm mayor: ', n2);
				writeln('Núm medio: ', n3);
				writeln('Núm menor: ', n1);
			end
	end
	else
	
		if (n1 < n2) and (n1 > n3) then
		begin
			writeln('Núm mayor: ', n2);
			writeln('Núm medio: ', n1);
			writeln('Núm menor: ', n3); 
		end
		else
			if (n1 > n2) and (n1 > n3) then
			begin
				if (n2 < n3) then
				begin 
					writeln('Núm mayor: ', n1);
					writeln('Núm medio: ', n3);
					writeln('Núm menor: ', n2);
				end
				else
					if (n2 > n3) then
					begin
						writeln('Núm mayor: ', n1);
						writeln('Núm medio: ', n2);
						writeln('Núm menor: ', n3);
					end
			end
			else
				if (n1 > n2) and (n1 < n3) then
				begin
					writeln('Núm mayor: ', n3);
					writeln('Núm medio: ', n1);
					writeln('Núm menor: ', n2);
				end
				else
					writeln('Ingresaste números de igual valor y no se pudo realizar la evaluación. Abortando proceso...');
End.








