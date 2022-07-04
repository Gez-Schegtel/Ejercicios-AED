

Ejercicio2

Dada una secuencia de caracteres de entrada, desarrollar un algoritmo que produzca 2 secuencias de salida, una con los caracteres "numéricos" y otra con los que no lo son.

Informar al final, cantidad de caracteres de cada secuencia de salida

Ejemplo: Si en la secuencia de entrada viniera "A125EB%" en la salida debería ir

salida 1

"125".

salida 2

AEB%




Acción exer_two ES;
Ambiente
	dig_nums = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
		
	sec_ent: secuencia de caracter;
	ent: caracter;
	
	sec_sal_nums: secuencia de caracter;
	
	sec_sal_car: secuencia de caracter;

	cont_nums: entero;
	cont_car: entero;
	
Proceso
	arr(sec_ent);
	avz(sec_ent, ent);
	
	crear(sec_sal_nums);
	crear(sec_sal_car);
	
	cont_nums:= 0;
	cont_car:= 0;
	
	Mientras NFDS(sec_ent) hacer
	
		Si (ent en (dig_nums)) entonces
			esc(sec_sal_nums, ent);
			cont_nums:= cont_nums + 1;
		sino
			esc(sec_sal_car, ent);
			cont_car:= cont_car + 1;
		Fin_si
		
		avz(sec_ent, ent);
		
	Fin_Mientras

	esc('En la secuencia de números hay ', cont_nums, ' elementos.');	
	esc('En la secuencia de caracteres hay ', cont_car, ' elementos.');
	
	cerrar(sec_ent);
	cerrar(sec_sal_nums);
	cerrar(sec_sal_car);
	
Fin_Acción.

	A|1|2|5|E|B|%|FDS

	num 1 2 5 
	
	car A e b




























