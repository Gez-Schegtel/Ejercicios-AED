



El Banco de AED tiene almacenada 2 secuencias de datos elementales con información respecto a cuentas de clientes y saldos de cada una.
La secuencia de caracteres CUENTAS almacena los datos de cuentas de clientes con el siguiente formato:

tipodecuenta('B' Basica - 'G' Gold - 'P' Premium)numerodecuenta(palabra que finaliza en un '+')
 
Por ejemplo: B2020211122+B322K22K+G3939221111+B933920+G99999+G56565W1+P333+* 
Como se observa la secuencia finaliza en un '*'
 
La secuencia SALDOS almacena los saldos de cada cuenta. El primer elemento de la secuencia SALDOS corresponde al saldo del primer cliente de la secuencia CUENTAS.
 
Ud debe procesar ambas secuencias y:
	1- Mostrar por pantalla los saldos de cuentas tipo PREMIUM que superen los 10millones de pesos. 
	2- Informar el total de cuentas cuyo saldo no superen los 100mil pesos.
	3- Crear una secuencia de salida incluyendo las cuentas tipo PREMIUM. Informar ademas por pantalla. ¿Cuántas son?

P2020211122+B322K22K+G3939221111+B933920+G99999+G56565W1+P333+* {Ejemplo de secA}

1234|1000000000|12312|124412|231512015|FDS {Ejemplo de secB}



Acción bancorky ES;
Ambiente
	sec1: secuencia de caracter;
	v1: caracter;
	
	sec2: secuencia de entero;
	v2: entero;
	
	sal: secuencia de caracter;

	contP: entero;
	contm: entero;
	
Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);

	crear(sal);
	
	contP:= 0;
	contm:= 0;
	
	mientras (v1 <> '*') y NFDS(sec2) hacer
		si (v1 = 'P') entonces
			si (v2 > 10000000) entonces
				esc('Esta cuenta de tipo premium posee un saldo de >> ', v2);
			fin_si
			
			contP:= contP + 1;
			
			mientras (v1 <> '+') hacer
				avz(sec1, v1);
				esc(sal, v1);
			fin_mientras
		
		sino
			mientras (v1 <> '+') hacer
				avz(sec1, v1);
			fin_mientras	
		fin_si
		
		si (v2 < 100000) entonces
			contm:= contm + 1;
		fin_si
		
		avz(sec1, v1);
		avz(sec2, v2);
	fin_mientras
	
	esc('Hay ', contP, ' cuentas premium.');
	esc('Hay ', contm, ' cuentas que no superan un saldo de $100000 pesos.');

	cerrar(sec1);
	cerrar(sec2);
	cerrar(sal);
Fin_Acción.


























