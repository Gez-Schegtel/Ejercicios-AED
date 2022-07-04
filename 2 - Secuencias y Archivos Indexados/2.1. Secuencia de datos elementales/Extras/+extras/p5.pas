




La empresa Game Virtual cuenta con información respecto al uso de sus juegos de realidad virtual.

1) Posee una secuencia de caracteres donde almacena datos de los juegos y versiones que comercializa, con la siguiente estructura: Disponibilidad(caracter que indica si está vigente o no S/N)Nombre del juego-Autor-Version(digito de 0 al 4)
La secuencia finaliza con un *. Veamos un ejemplo

SFight Virtual-Equipo Rojo-0 SWarriors-Equipo Del Norte-0NSkyBlue-Argentina-1*
 
Se te pide crear un algoritmo que permita:


	
*Crear una secuencia que incluya los datos correspondiente al nombre del juego y sus autores, siempre y cuando esté vigente

*Obtener la cantidad de juegos por tipo de versión (0-1-2).

*Hay juegos que no estén vigentes hoy y ya tengan una versión superior a 1? Qué porcentaje representan sobre el total de juegos?


Acción game_virtual ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	
	sal: secuencia de caracter;
	
	cont0: entero;
	cont1: entero;
	cont2: entero;
	contv: entero;
	contot: entero;

Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sec);
	
	cont0:= 0;
	cont1:= 0;
	cont2:= 0;
	contv:= 0;
	contot:= 0;
	
	mientras (v <> '*') hacer
		SFight Virtual-Equipo Rojo-0 SWarriors-Equipo Del Norte-0NSkyBlue-Argentina-1*
		si (v = 'S') entonces
			mientras (v <> '-') hacer
				avz(sec, v);
				esc(sal, v);
			fin_mientras
			avz(sec, v);
			
			mientras (v <> '-') hacer
				esc(sal, v);
				avz(sec, v);
			fin_mientras
			esc(sal, '-');
			
			avz(sec, v);
			
			según (v) hacer
				'0': cont0:= cont0 + 1;
				'1': cont1:= cont1 + 1;
				'2': cont2:= cont2 + 1;
			fin_según
		sino
			mientras (v <> '-') hacer
				avz(sec, v);
			fin_mientras
			avz(sec, v);
			
			mientras (v <> '-') hacer
				avz(sec, v);
			fin_mientras
			avz(sec, v);
			
			según (v) hacer
				'0': cont0:= cont0 + 1;
				'1': cont1:= cont1 + 1;
				'2': cont2:= cont2 + 1; contv:= contv + 1;
				'3': contv:= contv + 1;
				'4': contv:= contv + 1; 
			fin_según
			
		fin_si
		
		contot:= contot + 1;
		avz(sec, v);	
	
	fin_mientras
	
	esc('Juegos con versión 0 >> '; cont0);
	esc('Juegos con versión 1 >> '; cont1);
	esc('Juegos con versión 2 >> '; cont2);
	
	esc('Porcentaje de los juegos que no están vigentes y que tienen una versión superior a 1 representan el >> ', (contv*100)/contot);
	
	cerrar(sec);
	cerrar(sal);
Fin_Acción.





















