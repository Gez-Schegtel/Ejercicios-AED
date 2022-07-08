
Ejercicio 3: (Ejercicio 2.1.6 de los complementarios)

 Escribir un algoritmo que permita desglosar una secuencia de enteros que contiene monotonías crecientes (series de elementos consecutivos ordenados crecientemente; cada serie está constituida por un elemento como mínimo), en dos secuencias de salida, de tal modo que tales monotonías sean copiadas alternativamente en una de las secuencias resultado o en otra.

 

Ejemplo secuencia de entrada.

2, 5, 8, 11, 14, 17,15, 10,11,20, 44,12,14,16….

Secuencia de salida 1

2,5,8, 11, 14, 17, 10,11,20, 44…

Secuencia de salida 2

15, 12,14,16

y si te animas...: además de lo solicitado anteriormente, se pide: obtener la suma de los valores de cada secuencia y al final informar el mayor valor (de esas sumas).



Acción exer_three ES;
Ambiente
	sec_ent: secuencia de entero;
	ent: entero;
	
	sec_sal1: secuencia de entero;
	sal1: entero;
	
	sec_sal2: secuencia de entero;
	sal2: entero;
	
	aux: entero;
	band: entero;
	
Proceso	
	arr(sec_ent);
	avz(sec_ent, ent);
	
	esc(sec_sal1, sal1);
	aux:= ent;
	
	avz(sec_ent, ent);
	
	mientras NFDS(sec_ent) hacer
		
		si (ent > aux) or ((ent <= aux) and band = 2) entonces
			esc(sec_sal1, ent);
			band:= 1;	
		sino
			si (ent <= aux) entonces
				esc(sec_sal2, ent);
				band:= 2;
			fin_si
		fin_si
		
		aux:= ent;
		avz(sec_ent, ent);
		
	fin_mientras
	
	cerrar(sec_ent);
	cerrar(sec_sal1);
	cerrar(sec_sal2);
	
Fin_Acción.




accion enteros es 
 amb 
  var 
   secE,secS1,secS2:secuencia de enteros; 
   resE,vE,vS1,vS2,a1,a2:entero; 

 proceso 
  arr(secE);avz(secE;vE); 
  a1,a2:=0; 
  crear(secS1,secS2); 
 			
  mientras nfd(secE) hacer 
  
   repetir 
    vS1:=vE; 
    esc(secS1, vS1); 
    
    resE:=vE; 
    
    a1:=a1+vE; 
    
    avz(secE, vE); 
   hasta (vE<resE) y fd(secE); 
  
   mientras ()
    vS2:=vE; 
    esc(secS2;vS2); 
    resE:=vE; 
    a2:=a2+vE; 
    avz(secE;vE); 
   hasta (vE<resE) y fd(secE); 
  
  fm; 
 
 
  si(a1>a2) 
   entonces 
    esc(a1; " es el mayor valor"); 
  
   contrario 
    si(a1=a2) 
     entonces 
      esc("Ambas sumas son iguales: "; a1); 
     
     contrario 
      esc(a2; " es el mayor valor"); 
    
    fs; 
  fs; 
  cerrar(secS1;secS2); 
fa.







