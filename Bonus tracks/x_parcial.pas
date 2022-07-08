
//actualización unitaria
La Municipalidad de Resistencia desea actualizar los valores de los terrenos luego de una rezonificacion de los mismos. El valor final de cada terreno se calcula de la siguiente manera

Valor del Terreno = Superficie terreno (en M2) * valor del M2 * coeficiente de incremento

Para ello cuenta con la siguiente información:

    Un archivo maestro de los terrenos con los siguientes datos:

    MAESTRO Ordenado por Nro_Terreno
        Nro_Terreno Zona Ubicacion Superficie Valor

    Zona: codificadas de A a F
    Ubicación: codificada de 1 a 10

    Un arreglo V que contiene los valores del M2 por zona.

    Un archivo de movimientos

    MOVIMIENTO Ordenado por Nro_Terreno
        Nro_Terreno Zona Ubicacion Superficie Cod_Mov 

Se solicita actualizar (Alta Baja y Modificacion) los valores del archivo maestro, teniendo en cuenta que los unicos valores que se pueden actualizar es la zona y su valor.


Acción x_parcial ES;
Ambiente 
    master_of_puppets = registro 
        nro_terr: n(4);
        zona: ('A'..'F') ;
        ubic: 1..10;
        sup: entero;
        valor: real;  
    fin_registro 

    master: archivo de master_of_puppets ordenado por nro_terr;
    rmaster: master_of_puppets;
    
    act: archivo de master_of_puppets ordenado por nro_terr;
    ract: master_of_puppets;

    mov_of_puppets = registro
        nro_terr: n(4);
        zona: ('A'..'F');
        ubic: 1..10;
        sup: entero;
        cod_mov: ('A', 'B', 'M');
    fin_registro

    mov: archivo de mov_of_puppets ordenado por nro_terr;
    rmov: mov_of_puppets;

    arr: arreglo de ['A'..'F'] de real;
    x: 'A'..'F';

    coef_inc = 0.15;
    
    procedimiento carga es;
    proceso    
        para x:= 'A' hasta 'F' entonces
            esc('Ingrese el valor del M2 de la zona', x);
            leer(arr[x]);
        fin_para
    fin_procedimiento

    procedimiento avanzar_mae es;
    proceso    
        leer(mae,rmae);
        si FDA(mae) entonces
            rmae.nro_terr:= HV;
        fin_si
        
    fin_procedimiento

    procedimiento avanzar_mov ES;
    proceso 
        leer(mov, rmov);
        
        si FDA(mov) entonces 
            rmov.nro_terr:= HV;
        fin_si 
    fin_procedimiento

    procedimiento mae_menor es;
    proceso
        ract:= rmae;
        escribir(act,ract);
        avanzar_mae;
    fin_procedimiento

    procedimiento mae_mayor es;
    proceso
        si (rmov.cod_mov = 'A') entonces
            ract.nro_terr:= rmov.nro_terr;
            ract.zona:= rmov.nro_terr;
            ract.ubic:=  rmov.ubic;
            ract.sup:= rmov.sup;
            ract.valor:= ract.sup * arr[ract.zona] * coef_inc;
            
            esc(act, ract);
        sino
            si (rmov.cod_mov = 'B') entonces 
                esc('¡Error!, no se puede dar de baja un registro que no existe en el maestro.');
            sino 
                // 'M' //
                esc('Error, no se puede modificar un registro que no existe en el maestro.');             
            fin_si;
        fin_si
       
        avanzar_mov;
    fin_procedimiento

    procedimiento iguales es;
    proceso
        si (rmov.cod_mov = 'A') entonces
            escribir('Hay un error, no se puede dar de alta un registro que ya existe en el maestro.');
            ract:= rmae;
            esc(act, ract);
        sino
            si (rmov.cod_mov = 'B') entonces 
                esc('El archivo fue eliminado correctamente, a su casa');
            sino 
                // 'M' //
                ract:= rmae;
                ract.zona:= rmov.zona;          
                ract.valor:= ract.sup * arr[ract.zona] * coef_inc;            

                esc(act, ract);
            fin_si;
        fin_si
        
        avanzar_mae;
        avanzar_mov;
    fin_procedimiento
    
Proceso
    carga;
    
    abrir e/(mae);
    abrir e/(mov);
    abrir s/(act);
    
    avanzar_mae;
    avanzar_mov;

    mientras (rmae.nro_terr <> HV) o (rmov.nro_terr <> HV) hacer 
        
        si (rmae.nro_terr < rmov.nro_terr) entonces 
            mae_menor;
        sino
            si (rmae.nro_terr > rmov.nro_terr) entonces  
                mae_mayor;
            sino
                iguales;
            fin_si
        fin_si
        
    fin_mientras      

    cerrar(mae);
    cerrar(mov);
    cerrar(act);
Fin_Acción.

