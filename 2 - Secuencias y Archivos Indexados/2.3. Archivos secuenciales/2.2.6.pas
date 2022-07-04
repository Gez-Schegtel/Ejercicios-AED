
Se cuenta con una secuencia que contiene el Apellido y Nombre y Promedio General de los Graduados de una Facultad, y se solicita generar un listado con diversas recomendaciones para cubrir vacantes en una importante Empresa. Las mencionadas recomendaciones serán establecidas del siguiente modo: si el promedio es menor que 7, la recomendación será negativa ("NO"); por el contrario, si el promedio es menor que 8, la recomendación será positiva ("SI"); de lo contrario, si el promedio es menor que 9, la recomendación será favorable ("F"); por último, si el promedio supera los 9 puntos, la recomendación será muy favorable("MF"). El listado deber respetar el siguiente formato:

Apellido_Nombre Promedio Recomendación
Además, se solicita la impresión del total de graduados que recibieron cada una de las recomendaciones, y el promedio global de los mismos.

Acción 226 ES;
Ambiente
	graduado = registro
		ayn: an(30);
		prom: 1..10;
	fin_registro
	
	arch_gr: archivo de graduado;
	reg_gr: graduado;
	
	contgr: entero;
	acumlgr: real;
	
Proceso
	abrir E/(arch_gr);
	leer(arch_gr, reg_gr);
	
	contgr:= 0;
	acumlgr:= 0;
	
	esc('Apellido y Nombre | Promedio | Recomendación');
	
	Mientras NFDA(arch_gr) hacer
		según (reg_gr.prom) hacer
			<7: esc(reg_gr.ayn); esc(reg_gr.prom); esc('NO');
			<8: esc(reg_gr.ayn); esc(reg_gr.prom); esc('SI');
			<=9: esc(reg_gr.ayn); esc(reg_gr.prom); esc('F');
			>9: esc(reg_gr.ayn); esc(reg_gr.prom); esc('MF');
		fin_según
		
		contgr:= contgr + 1;
		acumlgr:= acumlgr + reg_gr.prom;
		
		leer(arch_gr, reg_gr);
	Fin_Mientras
	
	esc('Promedio global de los graduados >> ', acumlgr/contgr);
	
	cerrar(arch_gr);
Fin_Acción.





