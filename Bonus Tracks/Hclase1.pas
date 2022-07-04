
Como medida preventiva a las inundaciones en la ciudad, se debe realizar un programa que diga si estamos ante una posible inundación o no. 

Para ello el usuario ingresará la cantidad en mm de agua, con este dato el sistema debería indicar: si es menor a 70 muestra por pantalla que no hay peligro, si es mayor o igual a 70 pero menor o igual a 100 es la condición poco peligro, en caso de ser mayor a 100 pero menor o igual a 150 es condición muy peligrosa, superando los 150 es inundación inminente. 


Acción inund ES;
Ambiente
	h20: entero;
	
Proceso
	esc('Ingrese cantidad de agua en mm');
	leer(h20);
	
	Según h20 hacer
		  <70: esc('No hay peligro');
		<=100: esc('Poco peligro');
		<=150: esc('Muy peligroso');
		 >150: esc('La inundación es inminente.');
	Fin según

Fin_Acción


Acción inund ES;
Ambiente
	h20: entero;
	
Proceso
	esc('Ingrese cantidad de agua en mm');
	leer(h20);
	
	Si (h20 < 70) entonces 
		esc('No hay peligro');
	sino
		Si (h20 <= 100) entonces
			esc('Poco peligro');
		sino
			Si (h20 <= 150) entonces 
				esc('Muy peligroso');
			sino
				esc('La inundación es inminente.');
		 	Fin si
		 Fin si 
	Fin si 

Fin_Acción
