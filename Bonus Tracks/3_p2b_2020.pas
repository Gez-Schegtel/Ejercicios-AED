


Utilizando el archivo de FLOTAS del ejercicio anterior se desea emitir un reporte con la estadistica de la cantidad de flotas con más de 25.000 Km de la siguiente manera:
Teniendo en cuenta que se cuenta con un archivo indexado por cod_flota con información referente al avión.

AVIONES, indexado por cod_flota
cod_flota | cod_modelo | descripción | fecha_compra


vigente  |               Modelo                 |Total vigente
---------| Modelo 1      Modelo 2  ... Modelo 5 | 
Si       |  ...            ...           ...    |  ...             
No       |  ...            ...           ...    |  ...
T. modelo|  ...            ...           ...    | Total total


Acción parcial3b ES;
Ambiente 
    flotas_mae = registro
        cod_flota: n(4);
        vigente: ('S', 'N'); 
        cod_est: (1..4);  
        km_rec: n(6);
    fin_registro

    mae: archivo de flotas_mae ordenado por Cod_Flota;   
    rmae: flotas_mae;

    fecha = registro 
        aaaa: n(4);
        mm: 1..12;
        dd: 1..31;
    fin_registro 

    aviones = registro 
        cod_flota: n(4);
        cod_mod: (1..5);
        desc: an(255);
        f_compra: fecha;
    fin_registro 
    
    indie: archivo de aviones indexado por cod_flota;
    rindie: aviones;

    matt: arreglo [1..3, 1..6] de entero;
    x: entero; 
    y: entero;
    
    procedimiento carga ES;
    proceso 
        para x:= 1 hasta 3 hacer 
            para y:= 1 hasta 6 hacer 
                matt[x, y]:= 0;
            fin_para
        fin_para 
    fin_procedimiento

Proceso 
    carga;
    
    abrir e/(mae);
    leer(mae, rmae);

    abrir e/(indie);

    mientras NFDA(mae) hacer 
        rindie.cod_flota:= rmae.cod_flota;
        leer(indie, rindie);

        si EXISTE entonces 
    
            si (rmae.km_recorridos > 25000) entonces 
                matt[rmae.vigente, rindie.cod_mod]:= matt[rmae.vigente, rindie.cod_mod] + 1;
                matt[3, rindie.cod_mod]:= matt[3, rindie.cod_mod] + 1;
                matt[rmae.vigente, 6]:= matt[rmae.vigente, 6] + 1;
                matt[3, 6]:= matt[3, 6] + 1;
                    
            fin_si 

        sino 
            esc('No se ha encontrado el código de flota.');
        fin_si 

        leer(mae,rmae);
    fin_mientras
   
    para x:= 1 hasta 3-1 hacer
        si x = 1 entonces
            esc('La cantidad de flotas con más de 25.000 que siguen vigentes es de', matt[x,6]);
        sino 
            esc('La cantidad de flotas con más de 25.000 que no siguen vigentes es de', matt[x,6]);
        fin_si 
    fin_para

    para y:= 1 hasta 6-1 hacer 
        esc('Aviones que superaron los 25.000km del modelo ', y, ' >> ', matt[3, y]);
    fin_para 

    esc('Total de aviones que superaron los 25.000km >> ', matt[3,6]);

    cerrar(mae); 
    cerrar(indie);

Fin_Acción.
