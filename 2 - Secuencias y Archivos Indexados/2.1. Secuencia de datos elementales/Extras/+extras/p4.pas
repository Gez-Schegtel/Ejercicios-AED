
Ejercicio que me tomaron en el primer parcial.

Consigna:

	La empresa farmacéutica ARGUS recientemente recibió una notificación de auditoría de parte del ente regulador gubernamental. Por esto tuvo que desempolvar viejas cintas de respaldo para recuperar datos antiguos.

	La información básica de sus medicamentos antiguos se encuentra guardada en una secuencia de caracteres llamada MEDICAMENTOS. La cual contiene el nombre comercial del medicamento seguido de un carácter #. Cada medicamento tiene almacenado en otra secuencia (de enteros) llamada COMPRAS la cantidad de lotes comprados y, seguidamente, el precio unitario de cada lote (redondeado, sin decimales). Todo medicamento posee esos 2 datos en la segunda secuencia y el orden se corresponde uno a uno ( al primer medicamento de la secuencia MEDICAMENTOS, le corresponde 1er y 2do entero de la secuencia COMPRAS y así sucesivamente).

	Escriba un algoritmo que cumpla con las siguientes consignas:

	a) Emitir por pantalla el nombre de los medicamentos cuyo precio total de los lotes sea mayor a un determinado valor, el cual debe ser ingresado por el usuario.

	b) Grabar en una secuencia de salida el nombre de los medicamentos cuyo precio total de los lotes sea menor al ingresado, seguido de los caracteres 'L', 'O', 'W'.

	c) Informar por pantalla el porcentaje de medicamentos cuyo precio total de los lotes sea igual al importe ingresado.


medicamentos: ibu# migral# kilkio#FDS

compras: |  2  |   3   |   |5|2|   |9|10|FDS
          lote   valor


Acción farmacéuticas_pelotudeces ES;
Ambiente
	medicamentos: secuencia de caracter;
	med: caracter;
	
	compras: secuencia de entero;
	com: entero;
	
	sal: secuencia de caracter; 
	
	user_val: entero;
	
	contot: entero;
	cont_ig: entero;
	res: entero;

Proceso
	arr(medicamentos);
	avz(medicamentos, med);
	
	arr(compras);
	avz(compras, com);
	
	crear(sal);
	
	esc('Ingrese por favor, un importe que desee analizar: ');
	leer(user_val);
	
	contot:= 0;
	cont_ig:= 0;

	mientras NFDS(medicamentos) y NFDS(compras) hacer
		res:= v;
		avz(compras, com);
		
		si (com*res > user_val) entonces
			mientras (med <> '#') hacer
				esc(med);
				avz(medicamentos, med);
			fin_mientras
		sino
			si (com*res < user_val) entonces
				mientras (med <> '#') hacer
					esc(sal, med);
					avz(medicamentos, med);
				fin_mientras
				esc(sal, 'L');
				esc(sal, 'O');
				esc(sal, 'W');
			sino
				si (com*res = user_val) entonces
					cont_ig:= cont_ig + 1;
					
					mientras (v <> '#') hacer
						avz(medicamentos, med);
					fin_mientras
				fin_si
			fin_si
		fin_si
		
		res:= 0;
		contot:= contot + 1;
		avz(medicamentos, med);
		avz(compras, com);
	fin_mientras

	esc('Porcentaje de los medicamentos cuyo precio de lotes fue igual al ingresado >> ', (cont_ig*100)/contot, '%');

	cerrar(medicamentos);
	cerrar(compras);
	cerrar(sal);
Fin_Acción.

























