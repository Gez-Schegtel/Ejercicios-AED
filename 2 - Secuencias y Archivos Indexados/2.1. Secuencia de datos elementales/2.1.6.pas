

{

Dada una secuencia de enteros que almacena la cantidad de habitantes de las ciudades capitales de las 23 provincias de la República Argentina, discriminados 4 categorías: menores de 18 años (varones y mujeres) y mayores de 18 años (varones y mujeres). Se pide determinar la población total y los siguientes porcentajes: masculinos, femeninos, mayores de 18 y menores de 18.

/ 4 valores para cada provincia /

   rcia          ctes.    
 |12|20|2|2 | 15|22|23|6| fds

Acción 216 ES;
Ambiente
	sec: secuencia de entero;
	v: entero;
	
	i: entero;
	
	cont_tot: entero;
	cont_may_m: entero;
	cont_men_m: entero;
	cont_may_v: entero;
	cont_men_v: entero;
	
Proceso
	cont_tot:= 0;
	cont_may_m:= 0;
	cont_men_m:= 0;
	cont_may_v:= 0;
	cont_men_v:= 0;
	
	arr(sec);
	
	para i:= 1 hasta 23 hacer  // i = 23
		avz(sec, v);
		cont_men_v:= cont_men_v + v;
		
		avz(sec, v); 
		cont_men_m:= cont_men_m + v;	//    rcia          ctes.    
		
		avz(sec, v);				//  |12|20|2|2 | 15|22|23|6| fds
		cont_may_v:= cont_may_v + v;
		
		avz(sec, v);
		cont_may_m:= cont_may_m + v;
	fin_para
	
	cont_tot:= cont_may_v + cont_may_m + cont_men_v + cont_men_m;
	  
	esc('La población total es >> ', cont_tot);
	esc('El porcentaje de varones es >> ', (((cont_men_v + cont_may_v) * 100) / cont_tot), '%');
	esc('El porcentaje de mujeres es >> ', (((cont_men_m + cont_may_m) * 100) / cont_tot), '%');
	esc('El porcentaje de menores de edad es >> ', (((cont_men_v + cont_men_m) * 100) / cont_tot), '%');
	esc('El porcentaje de mayores de edad es >> ', (((cont_may_v + cont_may_m) * 100) / cont_tot), '%');
	
	cerrar(sec);
	
Fin_Acción.

}

program something;
type
	sec_nums = file of integer;
var
	sec: sec_nums;
	v: integer;
	
	i: integer;
	
	cont_tot: integer;
	cont_may_m: integer;
	cont_men_m: integer;
	cont_may_v: integer;
	cont_men_v: integer;
	
Begin
	cont_tot:= 0;
	cont_may_m:= 0;
	cont_men_m:= 0;
	cont_may_v:= 0;
	cont_men_v:= 0;
	
	assign(sec, 'num_sec.dat');
	reset(sec);
	
	for i:= 1 to 3 do  // i = 23
	begin
		read(sec, v);
		cont_men_v:= cont_men_v + v;
		
		read(sec, v); 
		cont_men_m:= cont_men_m + v;	//    rcia          ctes.    
		
		read(sec, v);				//  |12|20|2|2 | 15|22|23|6| fds
		cont_may_v:= cont_may_v + v;
		
		read(sec, v);
		cont_may_m:= cont_may_m + v;
	end;
	
	cont_tot:= cont_may_v + cont_may_m + cont_men_v + cont_men_m;
	
	writeln('La población total es >> ', cont_tot);
	writeln('El porcentaje de varones es >> ', (((cont_men_v + cont_may_v) * 100) / cont_tot):0:2, '%');
	writeln('El porcentaje de mujeres es >> ', (((cont_men_m + cont_may_m) * 100) / cont_tot):0:2, '%');
	writeln('El porcentaje de menores de edad es >> ', (((cont_men_v + cont_men_m) * 100) / cont_tot):0:2, '%');
	writeln('El porcentaje de mayores de edad es >> ', (((cont_may_v + cont_may_m) * 100) / cont_tot):0:2, '%');
	
	close(sec);
	
End.
