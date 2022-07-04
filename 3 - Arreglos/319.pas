

Ejercicio 3.19

Escribir un algoritmo que emita cuál es y dónde está ubicado el mayor elemento de cada fila de una matriz, e imprima un mensaje si todos los mayores se encuentran en la misma columna.

Acción 319 ES;
Ambiente 

    matt1: arreglo [1..5, 1..8] de entero; 

    procedimiento carga ES;
    proceso
        para x:= 1 hasta 5 hacer 
            para y:= 1 hasta 8 hacer 
                esc('Ingrese un número para el elemento', x, y);
                leer(matt1[x,y])                      
            fin_para;
        fin_para;    
    fin_procedimiento
    
    x: entero; 
    y: entero; 

Proceso 
    carga;

    para x:= 1 hasta 5 hacer
        may:= 0;
        
        para y:= 1 hasta 8-1  hacer
              
            si (matt1[x,y] > matt1[x,y+1]) entonces
                may:= matt1[x,y]; 
            fin_si 

        fin_para     

        esc('El mayor elemento de la fila ', y, ' es ', may);
    fin_para 

Fin_Acción.

