Ejercicio 3.14

El mes que viene se realizará en Buenos Aires el desfile “Alta Moda 2018”, el cual reúne a los diseñadores más reconocidos del país. Para organizar las pasadas, se dispone de un arreglo por diseñador, con la siguiente información: nombre de el/la modelo y altura. La directora del evento necesita que se imprima cada lista ordenada de acuerdo a la altura de el/la modelo. 
Escribir un algoritmo que permita ingresar los datos de cada diseñador e imprimirlos de acuerdo a lo solicitado.


Acción 3.1.4 ES;
Ambiente

    diseñador = registro 
        nombre: an(40);
        altura: n(3);
    fin_registro

    N= 50;
    arr1: arreglo [1..N] de diseñador;    
    
    procedimiento carga ES;
    proceso
        esc('Ingrese cuántos diseñadores va a cargar (no puede superar de 50) >> ');
        leer(cant_dis);
        
        para i:= 1 hasta (cant_dis) hacer
            esc('Ingrese el nombre del diseñador >> ');
            leer(arr1[i].nombre);

            esc('Ingrese la altura de la modelo >> ');
            leer(arr1[i].altura)
        fin_para
    fin_procedimiento
    
    i: entero; 
    cant_dis;
    op: ('s', 'n');
    nombre_diseñador: an(40);

Proceso 

	//Inserción directa - menor/mayor

	para i:= 2 hasta (cant_dis) hacer 

        x:= arr1[i].altura;
        j:= i - 1;

        mientras (arr1[j].altura > x) y (j > 0) hacer 
            arr1[j + 1].altura:= arr1[j].altura;
            j:= j - 1;
        fin_mientras

        arr1[j + 1].altura:= x;

    fin_para 
    
    para i:= 1 hasta (cant_dis) hacer 
        esc('Altura de la modelo >> ', i, arr1[i].altura);
        esc('Nombre del diseñador >> ', i, arr1[i].nombre);
    fin_para      
    
Fin_Acción.
    




