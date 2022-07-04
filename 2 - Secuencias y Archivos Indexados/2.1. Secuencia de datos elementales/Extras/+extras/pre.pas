





ENTRADA: BAGÓ-AMEDIALUN GBLABLA RMOON @ MONTPELLIER-ABLABLABLABLA GBLU AJOJO@FDS 

A-
(EJEMPLO CON A)
SALIDA: MEDIALUN8 BLABLABLABLA3 JOJO4| FDS

B-
(EJEMPLO CON A)
BAGÓ 1
MONTPELLIER 2


Acción pre-parcial ES;
Ambiente
	user_val = ('A', 'G', 'R');	
	
	sec: secuencia de caracter;
	v: caracter;
	
	sally: secuencia de caracter;
	
	contlab: entero;
	convert: entero;
	acuml_contlab: entero;
	contcar: entero;
	

Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sally);
		
	esc('Ingrese la línea terapéutica que desee analizar: ');
	leer(user_val);
	
	acuml_contlab:= 0;
		
	mientras NFDS(sec) hacer
	
		mientras (v <> '-') hacer
			// escribimos el nombre del lab
			esc(v);
			avz(sec, v);
		fin_mientras
		avz(sec, v);
		
		contlab:= 0;
		
		mientras (v <> '@') hacer
			
			mientras (v = ' ') hacer
				avz(sec, v);
			fin_mientras
			
			si (v en user_val) entonces
				contlab:= contlab + 1;
				
				avz(sec, v);
				
				contcar:= 0;
				mientras (v <> ' ') y (v <> '@') hacer
					contcar:= contcar + 1;
					esc(sally, v);
					avz(sec, v);
				fin_mientras
				
				si (contcar < 10) entonces
					
					según (contcar) hacer
						0: esc(sally, '0');
						1: esc(sally, '1');
						2: esc(sally, '2');
						3: esc(sally, '3');
						4: esc(sally, '4');
						5: esc(sally, '5');
						6: esc(sally, '6');
						7: esc(sally, '7');
						8: esc(sally, '8');
						9: esc(sally, '9');
					fin_según				
				sino
					convert:= (contcar DIV 10) + contcar MOD 10;
					
					según (convert) hacer
						1: esc(sally, '1');
						2: esc(sally, '2');
						3: esc(sally, '3');
						4: esc(sally, '4');
						5: esc(sally, '5');
						6: esc(sally, '6');
						7: esc(sally, '7');
						8: esc(sally, '8');
						9: esc(sally, '9');
					fin_según
				
				fin_si
				
				esc(sally, ' ');
			
			sino
				mientras (v <> ' ') y (v <> '@') hacer
					avz(sec, v);
				fin_mientras
				
			fin_si
		
		fin_mientras
		
		//escribe cantidad por lab
		esc(contlab);
		acuml_contlab:= acuml_contlab + contlab;
		avz(sec, v);
	fin_mientras
	
	esc('El total de veces que se encontró la línea terapéutica solicitada es >> ', acuml_contlab);
	
	cerrar(sec);
	cerrar(sally);
Fin_Acción.






















