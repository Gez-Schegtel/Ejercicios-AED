

La empresa "LexCorp", dedicada a la elaboración de piedras preciosas, recientemente encontró un viejo lote de gemas con su información correspondiente en un antiguo backup. Debido a su alto valor, desean obtener esta información lo más rápido posible.

La secuencia GEMAS, contiene por cada gema lo siguiente: inicialmente el nombre comercial de la gema, luego la composición química de la gema y, finalmente, una descripción de la principal aplicación de la gema (por ejemplo, uso industrial, cosmético, etc.). Todos estos datos están separados entre sí por comas ',', y al final de la última coma de una gema viene el caracter '%'.

En otra secuencia, CÓDIGOS, de enteros, se tiene un número (que va desde el 0 al 999) por cada gema, que indica el código comercial usado para la gema. Existe una correspondencia uno a uno con los datos de la secuencia GEMAS y la de CÓDIGOS (es decir, el pirmer código corresponde a la primer gema, el segundo a la segunda, etc.)

Escriba un algoritmo que cumpla con las siguientes consignas:

1- Escribir en una secuencia de salida (de caracteres) la composición química de la gema y el código comercial de la misma. Separar los datos entre comas.

2- Emitir por pantalla el nombre comercial de las gemas, siempre y cuando el código comercial de las mismas sea un número impar.

3- Se desea emitir por pantalla la cantidad de gemas analizadas y el porcentaje de éstas según el siguiente rango de códigos comerciales: entre 0 y 299, entre 300 y 699, y de 700 en adelante.




 

Acción gemas_y_pelotudeces ES;
Ambiente
	sec1: secuencia de caracter;
	v1: caracter;
	
	sec2: secuencia de entero;
	v2: entero;
	
	sal: secuencia de caracter;
	
	i: entero;
	convert: entero;
	
	ran1: 0..299;
	ran2: 300..699;
	ran3: 700..999;
	cont_g: entero;
	cont1: entero;
	cont2: entero;
	cont3: entero;

Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);
	
	crear(sal);
	
	cont_g:= 0;
	cont1:= 0;
	cont2:= 0;
	cont3:= 0;
	
	mientras NFDS(sec1) y NFDS(sec2) hacer
		
		si (v2 mod 2 <> 0) entonces
			mientras (v <> ',') hacer
				esc(v1);
				avz(sec1, v1);
			fin_mientras
		sino
			mientras (v1 <> ',') hacer
				avz(sec1, v1);
			fin_mientras
		fin_si
		avz(sec1, v1);	
		
		
		mientras (v <> ',') hacer
			esc(sal, v1);
			avz(sec1, v1);
		fin_mientras
		esc(sal, ',');
		
		mientras (v <> '%') hacer
			avz(sec1, v1);
		fin_mientras
		cont_g:= cont_g + 1;
		
		avz(sec1, v1);
		
		para i:= 2 hasta 0, -1 hacer
			convert:= (v2 DIV 10**i) MOD 10;
			
			según (convert) hacer
				0: esc(sal, '0');
				1: esc(sal, '1');
				2: esc(sal, '2');
				3: esc(sal, '3');
				4: esc(sal, '4');
				5: esc(sal, '5');
				6: esc(sal, '6');
				7: esc(sal, '7');
				8: esc(sal, '8');
				9: esc(sal, '9');
			fin_según
		fin_para
		esc(sal, ',');
		
		si (v2 en ran1) entonces
			cont1:= cont1 + 1;
		sino
			si (v2 en ran2) entonces
				cont2:= cont2 + 1;
			sino
				si (v2 = ran3) entonces
					cont3:= cont3 + 1;
				fin_si
			fin_si
		fin_si
		avz(sec2, v2);
		
	fin_mientras
	
	esc('Número total de gemas analizadas >> ', cont_g);
	esc('Porcentaje de gemas que tienen un código entre 0 y 299 >> ', (cont1*100)/cont_g, '%');
	esc('Porcentaje de gemas que tienen un código entre 300 y 699 >> ', (cont2*100)/cont_g, '%');
	esc('Porcentaje de gemas que tienen un código mayor a 700 >> ', (cont3*100)/cont_g, '%');
	
	cerrar(sec1);
	cerrar(sec2);
	cerrar(sal);
Fin_Acción.














