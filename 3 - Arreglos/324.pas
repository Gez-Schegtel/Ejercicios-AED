Ejercicio 3.24

Se cuenta con información acerca de los cajeros de un Supermercado, el cual se halla estructurado en 10 cajas registradoras. Dicha información está registrada en una secuencia que contiene Apellido y Nombre del empleado, número de caja que tiene asignada, importe facturado y horario de facturación; la secuencia está ordenada alfabéticamente por Apellido y Nombre. Se solicita una estadística de los importes facturados, discriminado por número de caja y franja de horas y además los montos totales, según el siguiente formato:

Cajas 	           8-10 	10-12 	12-16 	16-18 	18-20 	Total x Cajas
1 	                ... 	... 	... 	... 	... 	 ...
.. 	                ... 	... 	... 	... 	... 	 ...
10 	                ... 	... 	... 	... 	... 	 ...
Total x horas 	    ... 	... 	... 	... 	... 	 ...


Acción 324 ES;
Ambiente
    chabón_del_cajero = registro 
        nym: an(40);
        nro_caja: an(4);
        importe_fact: n(6);
        horario_fact: n(4);
    fin_registro

    matt_damon1: arreglo [1..11, 1..6] de chabón_del_cajero;

    x: entero; 
    y: entero;

    procedimiento carga ES;  
    proceso
        para x:= 1 hasta 11 hacer
            para y:= 1 hasta 6 hacer
            Escribir ('Cargue los datos de la matriz para la posición', x, y)
            leer(matt_damon1[x,y].nym);
            leer(matt_damon1[x,y].nro_caja);
            leer(matt_damon1[x,y].importe_fact);
            leer(matt_damon1[x,y].horario_fact);
            fin_para
        fin_para 
    fin_procedimiento
    
Proceso
    carga;
    
    para x:= 1 hasta 11-1 hacer
        para y:= 1 hasta 6-1 hacer
            matt_damon1[x,6]:= matt_damon1[x,6] + matt_damon1[x,y].importe_fact;
            matt_damon1[11,y]:= matt_damon1[11, y] + matt_damon1[x,y].importe_fact;
            matt_damon1[11,6]:= matt_damon1[11,6] + matt_damon1[x,y].importe_fact;
        fin_para
    fin_para

    para x:= 1 hasta 11-1 hacer 
        para y:= 1 hasta 6-1 hacer 
            esc('Total columna para ', x, y, ' >> ', matt_damon1[x,6]);
        fin_para
        esc('Total fila para ', x, y,' >> ', matt_damon1[11,y]);
    fin_para 
    esc('El total de totales >> ', matt_damon1[11,6]);

Fin_Acción.