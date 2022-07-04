

En pos de la reactiveción de los vuelos comerciales en el país, AEROLÍNEAS ARGENTINAS puso en marcha el plan para administrar sus vuelos, por lo que requiere actualizar la información respecto a su flota de aviones. Esta información se encuentra almacenada en un archivo secuencial:

Flotas: ordenado por Cod_Flota 

Cod_Flota | Vigente ('S'-'N') | Cod_Est | km_recorridos

Se dispone además de información sobre actualizaciones y uso de aviones. Para esto se cuenta con otro archivo secuencial:

Flota_Mov: ordenado por Cod_Flota

Cod_Flota | km_recorridos | Cod_Est

El Cod_Est es igual a: 

1: avión nuevo, incorporar a la flota. Se incorpora con vigente = 'si' y km_recorridos = 0

2: Avión en servicio, actualizar cant. de km_recorridos (acumulando)

3: avión en arreglo o mantenimiento

4: avión inoperable. Actualizar campo vigente

Solo existe como máximo un registro de actualización por cada avión. En todos los casos se debe actualizar el Cod_Est 

Al final informar 
    a) Total de aviones en cada estado del archivo actualizado 

    b) Porcentaje de aviones en cada estado, respecto al total 


Acción parcial3 ES;
Ambiente 
    flotas_mae = registro
        cod_flota: n(4);
        vigente: ('S', 'N'); 
        cod_est: (1..4);  
        km_rec: n(6);
    fin_registro
    
    mae: archivo de flotas_mae ordenado por Cod_Flota;   
    rmae: flotas_mae;
    act: archivo de flotas_mae ordenado por Cod_Flota;   
    ract: flotas_mae;

    flotas_mov = registro
        cod_flota: n(4);
        km_rec: n(6);
        cod_est: (1..4);
    fin_registro

    mov: archivo de flotas_mov ordenado por cod_flota;
    rmov: flotas_mov;

    arr: arreglo [1..4] de entero;
    x: entero;

    procedimiento carga ES;
    proceso 
        para x:= 1 hasta 4 hacer
            arr[x]:= 0;
        fin_para 
    fin_procedimiento

    procedimiento avanzar_mae ES;
    proceso 
        leer(mae, rmae);

        si FDA(mae) entonces 
            rmae.cod_flota:= HV;
        fin_si 
    fin_procedimiento
    
    procedimiento avanzar_mov ES;
    proceso 
        leer(mov, rmov);

        si FDA(mov) entonces 
            rmov.cod_flota:= HV;
        fin_si     
    fin_procedimiento
    
    procedimiento mae_menor es;
    proceso
        ract:= rmae;
        escribir(act,ract);
        avanzar_mae;
    fin_procedimiento

    procedimiento mae_mayor ES;
    proceso 
        si (rmov.cod_est = 1) entonces
            ract.cod_flota:= rmov_cod_flota;
            ract.vigente:= 'S';
            ract.cod_est:= rmov.cod_est;
            ract.km_rec:= 0;
            
            arr[ract.cod_est]:= arr[ract.cod_est] + 1;
            
            escribir(act, ract);    
        sino 
            esc('Hay un error.');
        fin_si

        avanzar_mov;
    fin_procedimiento


    procedimiento iguales ES;
    proceso 
        ract:= rmae;

        si (rmov.cod_est = 1) entonces
            esc('Hay un error.');
        sino 
            si (rmov.cod_est = 2) entonces
                ract.km_rec:= ract.km_rec + rmov.km_recorridos;
            sino
                si (rmov.cod_est = 3) entonces
                    ract.cod_est:= rmov.cod_est;
                sino 
                    ract.vigente:= 'N';
                fin_si             
            fin_si
        fin_si

        arr[ract.cod_est]:= arr[ract.cod_est] + 1;

        escribir(act,ract);
       
        avanzar_mae;
        avanzar_mov;
    fin_procedimiento

    tot_aviones: entero;    

Proceso 
    abrir e/(mae);
    abrir e/(mov);
    abrir /s(act);

    carga;
    
    avanzar_mae;
    avanzar_mov;
    
    mientras (rmae.cod_flota <> HV) o (rmov_cod_flota <> HV) hacer
        si (rmae.cod_flota > rmov.cod_flota) entonces
            mae_mayor;
        sino
            si (rmae.cod_flota < rmov.cod_flota) entonces
                mae_menor;
            sino
                iguales;
            fin_si
        fin_si
    fin_mientras
    
    para x:= 1 hasta 4 hacer
        esc('Aviones con código de estado ', x, ' >> ', arr[x]);    
    fin_para
    
    tot_aviones:= arr[1] + arr[2] + arr[3] + arr[4];
    para x:= 1 hasta 4 hacer
        esc('Porcentaje sobre el total del estado ', x, ' >> ', (arr[x] * 100)/tot_aviones, '% ');        
    fin_para
    
    cerrar (mae);
    cerrar (mov);
    cerrar (act);    

Fin_Acción.
