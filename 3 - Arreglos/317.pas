

Ejercicio 3.17

Se precisa generar una secuencia con los datos de los 10 videos más vistos de una categoría, a partir de una secuencia de entrada de 200 registros que contiene el Título de la película, Nombre del Director, Categoría de película, Cantidad de personas que la vieron y que está ordenada por el Título de la película.


Acción 317 ES;
Ambiente

    película = registro 
        título: an(40);
        director:: an(40);
        cat: ('t', 's');
        vistas: n(5)
    fin_registro

    arr1: arreglo [1..200] de película;

    procedimiento carga es
    proceso
        para i:= 1 hasta 200 hacer 
            esc('Título >> ');
            leer(arr1[i].título);
            esc('Director >> ');
            leer(arr1[i].director);
            esc('Categoría >> ');
            leer(arr1[i].cat);
            esc('Vistas >> ');
            leer(arr1[i].vistas)
        fin_para
    fin_procedimiento.

    i: entero;
    xv1: an(40); 
    xv2: an(40);
    xv3: ('t','s');
    xv4: n(5);
    j:= entero;
    
    u_cat: ('t', 's')
    stop: entero;
    
Proceso 
    carga;

    // Inserción directa - may/men 
    para i:= 2 hasta 200 hacer 
        
        xv1: arr1[i].título; 
        xv2: arr1[i].director;   
        xv3: arr1[i].cat; 
        xv4: arr1[i].vistas;
 
        j:= i - 1;

        mientras (xv4 < arr1[j].vistas) y (j > 0) hacer

            arr1[j+1].título:= arr1[j].título
            arr1[j+1].director:= arr1[j].director
            arr1[j+1].cat:= arr1[j].cat 
            arr1[j+1].vistas:= arr1[j].vistas 
            
            j:=j-1

        fin_mientras
         
        arr1[j+1].título:= xv1
        arr1[j+1].director:= xv2
        arr1[j+1].cat:= xv3
        arr1[j+1].vistas:= xv4

    fin_para

    // Selección directa may/men,
    para i:= 1 a 200-1 hacer
        xv1: arr1[i].título; 
        xv2: arr1[i].director;   
        xv3: arr1[i].cat; 
        xv4: arr1[i].vistas;
        max:=i

        para j:= i+1 a 200 hacer
            si (xv4 < arr1[j].vistas) entonces
                max:=j
                xv1:=arr1[j].título
                xv2:=arr1[j].director
                xv3:=arr1[j].cat
                xv4:=arr1[j].vistas
            fin_si
        fin_para
     
        arr1[max]:= arr1[i]
        arr1[i].título:= xv1
        arr1[i].director:= xv2
        arr1[i].cat:= xv3
        arr1[i].vistas:= xv4
    
    fin_para


    Escribir ('Ingrese la categoría de la cuál quiere saber los diez videos más visto')
    leer(u_cat)

    stop:= 0;
    i:= 1;
  
    mientras (i <= 200) y (stop <= 10) hacer 
    
        si (arr1[i].cat = u_cat) y (stop <= 10) entonces
            esc('Título de la película >> ', arr1[i].título);
            esc('Cantidad de vistas >> ', arr1[i].vistas);
            esc('Categoría >> ', u_cat, ', se encontró en la posición >> ', i);

            stop:= stop + 1;        
        fin_si

        i:= i + 1;
    fin_mientras

Fin_Acción.
