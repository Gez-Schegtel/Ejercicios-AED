

{
El siguiente es un ejercicio del primer parcial del año 2017: La empresa TICKET-TEC ha generado una secuencia de caracteres con informacion de sus ventas para los eventos de los últimos 3 meses, cuya estructura se describe a continuacion. Inicialmente existe el nombre del local de los eventos, cuya longitud se desconoce, termina con un #; a continuacion se tiene la informacion de todos los tickets vendidos para ese local, separado cada ticket del siguiente con el caracter !, y al final de todas las ventas para ese local, el caracter &. Por último la marca de fin de secuencia. También en el caso de butaca se desconoce la longitud del número, termina con un guion.

EJEMPLO
Teatro Opera#270520171A45-2030!270520173D120-2230!280520172C233-2030!&Galpon de las Luces#070720171C5-2030!301020172A233-2230!&|FDS

local de eventos#Fecha del evento[ddmmaaaa] codigo del evento[1..3] butaca [sector [A,C o D], número] - horario evento [hhmm]!

Solo hay dos horarios 20:30 y 22:30.

La empresa solicita un algoritmo que cumpla con las siguientes consignas:

1) Generar una nueva secuencia de salida con el mismo formato, que contenga los tickets correspondientes a un mesingresado por el usuario.

2) Informar total general de tickets vendidos, total de tickets por evento y porcentaje de cada uno sobre el total general.



Acción 2131 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;	
	
	sally: secuencia de caracter;
	
	user_m1: caracter;
	user_m2: caracter; 
	res1: caracter;
	res2: caracter;
	res3: caracter;
	
	i: entero;
	cont1: entero;
	cont2: entero;
	cont3: entero;
	tot_tick: entero;

Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sally);

	cont1:= 0;
	cont2:= 0;
	cont3:= 0;
	
	esc('Por favor, ingrese el mes que desee analizar, en formato mm separados por ENTER.');
	leer(user_m1);
	leer(user_m2);
	
	Mientras NFDS(sec) hacer 

		mientras (v <> '#') hacer //Avanzo el nombre del local y lo escribo
			esc(sally, v); 
			avz(sec, v);
		fin_mientras
		
		esc(sally, '#'); //Escribo para que me quede del mismo formato
		avz(sec, v);
		
		mientras (v <> '&') hacer //Trato los tickets de cada lugar

			res1:= v;
			avz(sec, v);
			res2:= v;
			avz(sec, v);
			res3:= v;
			avz(sec, v);
					
			si (res3 = user_m1) y (v = user_m2) entonces
			
				esc(sally, res1);
				esc(sally, res2);
				esc(sally, user_m1);
				esc(sally, user_m2);
	
				para i:= 1 hasta 5 hacer 
					avz(sec, v);
					esc(sally, v);
				fin_para

				según (v) hacer
					'1': cont1:= cont1 + 1;
					'2': cont2:= cont2 + 1;
					'3': cont3:= cont3 + 1;
				fin_según
				
				mientras (v <> '!') hacer 
					avz(sec, v);
					esc(sally, v);
				fin_mientras
				
			sino
				para i:= 1 hasta 5 hacer 
					avz(sec, v);
				fin_para

				según (v) hacer
					'1': cont1:= cont1 + 1;
					'2': cont2:= cont2 + 1;
					'3': cont3:= cont3 + 1;
				fin_según
				
				mientras (v <> '!') hacer 
					avz(sec, v);
				fin_mientras
			
			fin_si
			
			avz(sec, v);
		
		fin_mientras
					
		esc(sally, '&'); //idem línea 61		
		avz(sec, v);
		
	Fin_Mientras
	
	tot_tick:= cont1 + cont2 + cont3; 
	
	esc('Total de tickets vendidos >> ', tot_tick);
	esc('Total evento 1 >> ', cont1, ', representa el >> ', cont1*100/tot_tick, '%');
	esc('Total evento 2 >> ', cont2, ', representa el >> ', cont2*100/tot_tick, '%');
	esc('Total evento 3 >> ', cont3, ', representa el >> ', cont3*100/tot_tick, '%');
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.


}


{
program something;
var
	sec: text;
	v: char;	
	
	sally: text;
	
	user_m1: char;
	user_m2: char; 
	res1: char;
	res2: char;
	res3: char;
	
	i: integer;
	cont1: integer;
	cont2: integer;
	cont3: integer;
	tot_tick: integer;

Begin
	assign(sec, 'entrada31.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida31.txt');
	rewrite(sally);

	cont1:= 0;
	cont2:= 0;
	cont3:= 0;
	
	writeln('Por favor, ingrese el mes que desee analizar, en formato mm separados por ENTER.');
	readln(user_m1);
	readln(user_m2);
	
	while not eof(sec) do 
	begin
		while (v <> '#') do //Avanzo el nombre del local
		begin
			write(sally, v); //la profe dijo que copie el nombre por más que no cumpla la cond.
			read(sec, v);
		end;
		write(sally, '#');
		read(sec, v);
		
		while (v <> '&') do //Trato los tickets de cada lugar
		begin			
			res1:= v;
			read(sec, v);
			res2:= v;
			read(sec, v);
			res3:= v;
			read(sec, v);
			
			//Teatro Opera#270520171A45-2030!270520173D120-2230!280520172C233-2030!&Galpon de las Luces#070720171C5-2030!301020172A233-2230!&|FDS	
			
			if (res3 = user_m1) and (v = user_m2) then
			begin
				write(sally, res1);
				write(sally, res2);
				write(sally, user_m1);
				write(sally, user_m2);
	
				for i:= 1 to 5 do 
				begin
					read(sec, v);
					write(sally, v);
				end;

				case (v) of
					'1': cont1:= cont1 + 1;
					'2': cont2:= cont2 + 1;
					'3': cont3:= cont3 + 1;
				end;
				
				while (v <> '!') do 
				begin
					read(sec, v);
					write(sally, v);
				end;
				
			end
			else
				begin
					for i:= 1 to 5 do 
					begin
						read(sec, v);
					end;

					case (v) of
						'1': cont1:= cont1 + 1;
						'2': cont2:= cont2 + 1;
						'3': cont3:= cont3 + 1;
					end;
					
					while (v <> '!') do 
					begin
						read(sec, v);
					end;
				end;		
		
			read(sec, v);
		end;
					
		write(sally, '&');		
		read(sec, v);
		
	end;
	
	tot_tick:= cont1 + cont2 + cont3; 
	
	writeln('Total de tickets vendidos >> ', tot_tick);
	writeln('Total evento 1 >> ', cont1, ', representa el >> ', cont1*100/tot_tick:0:2, '%');
	writeln('Total evento 2 >> ', cont2, ', representa el >> ', cont2*100/tot_tick:0:2, '%');
	writeln('Total evento 3 >> ', cont3, ', representa el >> ', cont3*100/tot_tick:0:2, '%');
	
	close(sec);
	close(sally);
	
End.
}


Acción 2.1.31
	Ambiente
		sec_ticket,sec_salida: secuencia de caracter
		v:caracter
		m1,m2: caracter
		r1,r2,r3:caracter
		cont_tick1,cont_tick2,cont_tick3,cont_tot:entero

	Proceso
		Escribir ("Ingrese el mes:")
		Leer(m1)
		Leer(m2)
		arr(sec_ticket)
		avz(sec_ticket,v)
		crear(sec_salida)

{Teatro Opera#270520171A33-2030!}
	Mientras NFDS (sec) hacer
		Mientras v <> "&" hacer
			Mientras v <> "#" hacer
				Escribir (sec_salida,v)
				avz(sec,v)
			Fin_Mientras
			Escribir (sec_salida,"#")

			avz(sec,v)

			r1:=v
			avz(sec,v)
			r2:=v
			avz(sec,v)
			r3:=v
			avz(sec,v)

			Si v = m2 y r3=m1 entonces
				Escribir (sec_salida,r1)
				Escribir (sec_salida,r2)
				Escribir (sec_salida,r3)
				Escribir (sec_salida,v)
				avz(sec,v)
				Para i:= 1 hasta 4 hacer
					Escribir(sec_salida,v)
					avz(sec,v)
				Fin_Para

				Según v hacer
					"1": cont_tick1:=cont_tick1+1  
					"2": cont_tick2:=cont_tick2+1
					"3": cont_tick3:=cont_tick3+1
				Fin_Segun
				Escribir (sec_salida,v)
				
				Mientras v <> "!"
					avz(sec,v)
					Escribir (sec_salida,v)
				Fin_Mientras
				Escribir(sec_salida,"!")
			sino
				Para:=1 hasta 5 hacer
					avz(sec_ticket,v)
				Fin_Para
				
				Según v hacer
					"1": cont_tick1:=cont_tick1+1  
					"2": cont_tick2:=cont_tick2+1
					"3": cont_tick3:=cont_tick3+1
				Fin_Segun
				Mientras v <> "!"
					avz(sec,v)
				Fin_Mientras
			Fin_Si
			avz(sec_ticket,v)
			
		Fin_Mientras
		Escribir(sec_salida,"&")
		avz(sec_ticket,v)
	
	Fin_Mientras
	cont_tot:= cont_tick1+cont_tick2+cont_tick3
	Escribir ("El total general de tickets vendidos es: ", cont_tot, ".")
	Escribir ("El total de tickets del evento 1 es de: ", cont_tick1, ". El porcentaje del mismo sobre el total general es: " , (cont_tick1*100)/cont_tot, "%." )
	Escribir ("El total de tickets del evento 2 es de: ", cont_tick2, ". El porcentaje del mismo sobre el total general es: " , (cont_tick2*100)/cont_tot, "%." )
	Escribir ("El total de tickets del evento 3 es de: ", cont_tick3, ". El porcentaje del mismo sobre el total general es: " , (cont_tick3*100)/cont_tot, "%." )
	cerrar(sec_ticket)
	cerrar(sec_salida)

Fin_Acción	




















