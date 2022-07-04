


La empresa posee una secuencia de caracteres COMPONENTES, el cual contiene el nombre de la marca de una serie de componentes (mínimo 3 caracteres y finaliza con el caracter '#'). Luego de eso vienen los componentes de esa marca. Por cada componente viene el código del mismo (3 dígitos), la categoría ('1', '2', '3', '4') y la descripción del componente (puede ser de hasta 255 caracteres y termina con un '@'). Luego del último componente de una marca, está el caracter '%'. Tenga en cuenta que puede haber varias marcas, con varios componentes cada una.

	Escriba un algortimo que cumpla con las siguientes consignas:

	a) Informar marca con mayor cantidad de componentes (solamente sus 3 primeras inciales) // esto sin sec aux no se puede

	b) Informar cantidad de componentes por categoría.

	c) Generar una secuencia de salida de enteros que contenga todos los códigos de los componentes.



COMPONENTES: Intel#  321 1 estádesbloqueadodefábrica @ 211 2 lomismoqueelotro @ % AMD# 654 4 bla @ %    FDS

Acción something ES;
Ambiente
	sec: secuencia de caracteres;
	v: caracter; 
	
	sally: secuencia de entero;
	
	i: entero;
	acuml: entero;
	
	cont_cat1: entero;
	cont_cat2: entero;
	cont_cat3: entero;
	cont_cat4: entero;
	cont_comp: entero;
	
Proceso
	arr(sec);
	avz(sec, v);

	crear(sally);
	
	cont_cat1:= 0;
	cont_cat2:= 0;
	cont_cat3:= 0;
	cont_cat4:= 0;
	cont_comp:= 0;
	
	mientras NFDS(sec) hacer
		r1:= v;
		avz(sec, v);
		r2:= v;
		avz(sec, v);
		r3:= v;
		
		mientras (v <> '#') hacer
			avz(sec, v);
		fin_mientras
		avz(sec, v);
		
		mientras (v <> '%') hacer
		
			acuml:= 0;
			para i:= 2 hasta 0, -1 hacer
				según (v) hacer
					'0': acuml:= acuml + (0 * 10**i);
					'1': acuml:= acuml + (1 * 10**i); 
					'2': acuml:= acuml + (2 * 10**i); 
					'3': acuml:= acuml + (3 * 10**i); 
					'4': acuml:= acuml + (4 * 10**i); 
					'5': acuml:= acuml + (5 * 10**i); 
					'6': acuml:= acuml + (6 * 10**i); 
					'7': acuml:= acuml + (7 * 10**i); 
					'8': acuml:= acuml + (8 * 10**i); 
					'9': acuml:= acuml + (9 * 10**i); 
				fin_según 
				
				avz(sec, v);
			fin_para 
			esc(sally, acuml);
			
			según (v) hacer
				'1': cont_cat1:= cont_cat1 + 1;
				'2': cont_cat2:= cont_cat2 + 1;
				'3': cont_cat3:= cont_cat3 + 1;
				'4': cont_cat4:= cont_cat4 + 1;
			fin_según
			
			mientras (v <> '@') hacer
				avz(sec, v);
			fin_mientras 
			
			cont_comp:= cont_comp + 1;
			
			avz(sec, v);
		
		fin_mientras
		
	fin_mientras
	
	cerrar(sec);
	cerrar(sally);
	
Fin_Acción.













