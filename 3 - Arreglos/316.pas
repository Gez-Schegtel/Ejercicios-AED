
Ejercicio 3.16

Una empresa que comercializa una cierta cantidad de artículos diferentes desea confeccionar un ranking de ventas de los mismos, a partir de una secuencia ordenada por articulo que contiene:

NRO_ARTICULO 	TIPO 	CANT_VENDIDA
		

Escribir un algoritmo que emita el ranking deseado en orden decreciente por cantidad.

Acción 316 ES;
Ambiente
    producto = registro 
        nro_art: n(4);
        tipo: ('th', 's', 'd', 'p');
        cant_vendida: n(4);
    fin_registro

    arr1: arreglo [1..50] de producto; 
    
    procedimiento carga ES;
    proceso
        para i:=1 hasta 50 hacer
            esc('Número de artículo >> ');
            leer(arr1[i].nro_art)

            esc('Tipo >>')
            leer(arr1[i].tipo)

            esc('Cantidad vendida >>')
            leer(arr1[i].cant_vendida)
        fin_para
    fin_procedimiento

    i: entero;
    xv1: n(4);
    xv2: n(4);
    xv3: ('th', 's', 'd', 'p');
    j: entero;
    máx: entero;
    
Proceso 
    carga;

    // Inserción directa - may/men
    
    para i:= 2 hasta 50 hacer

        xv1:= arr1[i].cant_vendida;
        xv2:= arr1[i].nro_articulo
        xv3:= arr1[i].tipo
        
        j:= i - 1;  //j es la posición anterior 

        { arr1[j].cant_vendida < xv ==> si lo asignado en j, o sea la posición anterior, es menor a lo que está en xv, que es lo que está adelante de j, o sea, en i
        }
        
        mientras (arr1[j].cant_vendida < xv1) y (j > 0) hacer 

            arr1[j + 1].cant_vendida:= arr1[j].cant_vendida;
            arr1[j + 1].nro_articulo:= arr1[j].nro_articulo
            arr1[j + 1].tipo:= arr1[j].tipo

            j:= i - 1;

        fin_mientras 

        arr1[j + 1].cant_vendida:= xv1;
        arr1[j + 1].nro_art:= xv2;
        arr1[j + 1].tipo:= xv3;

    fin_para 

    

    //Selección directa - may/men
	
	para i:= 1 hasta (50 - 1) hacer 

        xv1:= arr1[i].cant_vendida;
        xv2:= arr1[i].nro_art
        xv3:= arr1[i].tipo
        máx:= i; 
      
        para j:= (i + 1) hasta 50 hacer
            
            si (xv1 < arr1[j].cant_vendida) entonces
            
                xv1:= arr1[j].cant_vendida;
                xv2:= arr1[j].nro_art
                xv3:= arr1[j].tipo
                
                máx:= j;
            
            fin_si
       
        fin_para
        
        arr1[máx]:= arr1[i];
       
        arr1[i].cant_vendida:= xv1;
        arr1[i].nro_art:= xv2;
        arr1[i].tipo:= xv3;

    fin_para  


    para i:= 1 hasta 50 hacer 
        esc('Número de artículo >> ', arr1[i].nro_art);
        esc('Tipo >> ', arr1[i].tipo);
        esc('Cantidad vendida >> ', arr1[i].cant_vendida);
    fin_para 


Fin_Acción.