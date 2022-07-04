


Se dispone de 2 secuencias de caracteres, una contiene caracteres, incluidos espacios y otra contiene caracteres “numéricos”. Se pide crear una nueva secuencia de salida de caracteres donde se copien los caracteres de ambas secuencias en forma alternada, o sea un carácter, un digito, un carácter, un digito, etc.

Ejemplo:

Sec1: Para habilitar la función de Sala     s para grupos pequeños para su uso*

Sec2: 13481460918460846161334868461086*

Salida: P1a3r4a8 1h4….

1) Analice y responda: Que pasaría en el caso de que una secuencia de entrada termine antes que la otra? se podría cumplir con la consigna?

**/ No pasaría nada, se cortaría la secuencia de salida dependiendo de qué secuencia de entrada termine primero.

2) Como modificaría el algoritmo en el caso de que solicite contar la cantidad de caracteres de cada secuencia y mostrar por pantalla al final del proceso?


Acción exer_four ES;
Ambiente
	sec1: secuencia de caracter;
	v1: caracter;
	
	sec2: secuencia de caracter;
	v2: caracter;
	
	sally: secuencia de caracter;
	
	cont_tot: entero;
	cont1: entero;
	cont2: entero;
	
Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);
	
	crear(sally);
	
	cont_tot:= 0;
	
	Mientras NFDS(sec1) y NFDS(sec2) hacer
				
		esc(sally, v1);
		esc(v1);
		
		esc(sally, v2);
		esc(v2);
		
		cont_tot:= cont_tot + 1;
		
		avz(sec1, v1);
		avz(sec2, v2);
	
	Fin_Mientras
	
	cont1:= cont_tot;
	cont2:= cont_tot;
	
	Mientras NFDS(sec1) hacer
		cont1:= cont1 + 1;
		avz(sec1, v1);
	Fin_Mientras
	
	Mientras NFDS(sec2) hacer
		cont2:= cont2 + 1;
		avz(sec2, v2);
	Fin_Mientras
	
	esc('La secuencia 1 tiene ', cont1, ' elementos.');
	esc('La secuencia 2 tiene ', cont2, ' elementos.');
	esc('La secuencia de salida posee ', cont_tot*2, ' elementos.');
	
	cerrar(sec1);
	cerrar(sec2);
	cerrar(sally);
	
Fin_Acción.

