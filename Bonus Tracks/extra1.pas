
==============================================

		** Enunciado **

==============================================

Ejercicio1

Dada una secuencia de caracteres de entrada, desarrollar un algoritmo que produzca una secuencia de salida de caracteres; la que contendrá solo los caracteres “numéricos” correspondientes a dígitos impares encontrados en la secuencia de entrada.

Ejemplo: Si en la entrada viniera "A125EB%" en la salida debería ir "15".

Al final del proceso informar:

1)  Cuantos dígitos impares encontró

2)  Cuantos dígitos pares

3)  Total de caracteres “numéricos” (dígitos) y porcentaje de pares e impares



Acción exer_one ES;
Ambiente
	sec_ent: secuencia de caracter;
	ent: caracter;
	
	sec_sal: secuencia de caracter;
	sal: caracter;
	
	cont_imp: entero;
	cont_par: entero;
	
Proceso
	arr(sec_ent);
	avz(sec_ent, ent);
	
	crear(sec_sal);
	
	cont_imp:= 0;
	cont_par:= 0;
	
	Mientras NFDS(sec_ent) hacer
		
		Según (ent) hacer
			
			'1': esc(sec_sal, ent); cont_imp:= cont_imp + 1;
			
			'2': cont_par:= cont_par + 1;
			
			'3': esc(sec_sal, ent); cont_imp:= cont_imp + 1;
			
			'4': cont_par:= cont_par + 1;
			
			'5': esc(sec_sal, ent); cont_imp:= cont_imp + 1;
			
			'6': cont_par:= cont_par + 1;
			
			'7': esc(sec_sal, ent); cont_imp:= cont_imp + 1;
			
			'8': cont_par:= cont_par + 1;
			
			'9': esc(sec_sal, ent); cont_imp:= cont_imp + 1;
		
		Fin_Según
		
		avz(sec_ent, ent);
		
	Fin_Mientras
	
	esc('El total de dígitos numéricos en la secuencia es >> ', cont_imp + cont_par);
	esc('Porcentaje de impares >> ', (cont_imp * 100)/(cont_imp + cont_par));
	esc('Porcentaje de pares >> ', (cont_par * 100)/(cont_imp + cont_par));
	
	cerrar(sec_ent);
	cerrar(sec_sal);
	
Fin_Acción.

==============================================

		** Versión 2 **

==============================================


Acción exer_one_op2 ES;
Ambiente
	impares = {'1', '3', '5', '7', '9'};
	pares = {'2', '4', '6', '8'}
	
	sec_ent: secuencia de caracter;
	ent: caracter;
	
	sec_sal: secuencia de caracter;
	sal: caracter;
	
	cont_imp: entero;
	cont_par: entero;
	
Proceso
	arr(sec_ent);
	avz(sec_ent, ent);
	
	crear(sec_sal);
	
	cont_imp:= 0;
	cont_par:= 0;
	
	Mientras NFDS(sec_ent) hacer
		
		Si (ent en (impares)) entonces
			esc(sec_sal, ent); cont_imp:= cont_imp + 1;
		sino
			Si (ent en (pares)) entonces
			cont_par:= cont_par + 1;
		Fin_si
		
		avz(sec_ent, ent);
		
	Fin_Mientras
	
	esc('El total de dígitos numéricos en la secuencia es >> ', cont_imp + cont_par);
	esc('Porcentaje de impares >> ', (cont_imp * 100)/(cont_imp + cont_par));
	esc('Porcentaje de pares >> ', (cont_par * 100)/(cont_imp + cont_par));
	
	cerrar(sec_ent);
	cerrar(sec_sal);
	
Fin_Acción.








