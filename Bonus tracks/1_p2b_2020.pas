


El servicio meteorológico Nacional dispone de un archivo secuencial con datos históricos de las precipitaciones diarias caídas en el año para la provincia del Chaco.

PRECIPITACIONES_ANUALES (Ordenado por Pluviometroid y FechaRegistro)

| PluviometroID | FechaRegistro | Precipitaciones | EstadoPluviómetro |


Al final de cada día, este archivo es actualizado con los datos que son extraídos de los pluviómetros (instrumento para medir la cantidad de lluvia caída). Para ello, se cuenta con otro archivo secuencial con las mediciones de cada día.


MEDICIONES (Ordenado por Pluviometroid y FechaRegistro)

| PluviometroID | FechaRegistro | HoraRegistro | EstadoPluviómetro | Precipitaciones |


Además, se cuenta con un archivo de Pluviómetros indexado por el campo Pluviometroid

| PluviometroID | Modelo | Descripción | Departamento (1..25) |

Se lo contrató a usted para que desarrolle un algoritmo que se encargue de actualizar el archivo de PRECIPITACIONES_ANUALES.

Consideraciones a tener en cuenta:

	+ En el archivo mediciones podrán existir varias mediciones para un mismo día en distintos horarios.
	
    + Los posibles estados de un pluviómetro podrán ser: 
		* Activo: AC 
		* En mantenimiento: MA 
	
    + Sólo se tendrán en cuenta aquellas precipitaciones en las que el estado del pluviómetro es activo.
	
    + La información de los nombres de los departamentos se encuentra en un arreglo, donde el valor del campo DEPARTAMENTO del archivo PLUVIÓMETROS, representa la posición en dicho arreglo.

Además se solicita la siguiente información:
	a) cantidad de pluviómetros en mantenimiento
	
    b) para los pluviómetros en mantenimiento informar el ID del pluviómetro y el nombre del departamento en el que se encuentra.


Acción p2b ES; 
Ambiente 
    fecha = registro 
        aaaa: n(4);
        mm: 1..12;
        dd: 1..31;
    fin_registro 

    clave = registro 
        pluv_id: n(4);
        f_reg: fecha;
    fin_registro 

    precipitaciones_anuales = registro
        clave_mae: clave;
        precip: n(4);
        estado_pluv: ('AC', 'MA');
    fin_registro     

    mae: archivo de precipitaciones_anuales ordenado por pluv_id y f_reg;
    rmae: precipitaciones_anuales;

    act: archivo de precipitaciones_anuales ordenado por pluv_id y f_reg;
    ract: precipitaciones_anuales;

    mediciones = registro 
        clave_mov: clave;
        hs_reg: n(4);
        est_pluv: ('AC', 'MA');
        precip: n(4);
    fin_registro 

    mov: archivo de mediciones ordenado por pluv_id y f_reg;
    rmov: mediciones;

    pluviométros = registro 
        pluv_id: n(4);
        model: an(40);
        desc: an(255);
        dpto: 1..25;
    fin_registro 

    indie: archivo de pluviómetros indexado por pluv_id;
    rindie: pluviómetros;

    arr: arreglo [1..25] de an(40);
    x: entero;

    procedimiento cargar_arr ES; 
    proceso 
        para x:= 1 hasta 25 hacer 
            esc('Ingrese nombre de dpto >> ');
            leer(arr[x]);
        fin_para 
    fin_procedimiento 

    procedimiento avanzar_mae ES;
    proceso
        leer(mae, rmae);
        si FDA(mae) entonces
            rmae.clave_mae: HV;
        fin_si
    fin_procedimiento
    
    procedimiento avanzar_mov ES;
    proceso
        leer(mov,rmov)
        si FDA (mov) entonces
            rmov.clave_mov:= HV;
        fin_si
    fin_procedimiento
    
    cont_ma: entero;
    
    procedimiento mae_mayor ES;
    proceso 
        si (rmov.est_pluv = 'AC') entonces 
            ract.clave_mae:= rmov.clave_mov;
            ract.est_pluv:= rmov.est_pluv;
            ract.precip:= rmov.precip;

            avanzar_mov;

            mientras (ract.clave_mae = rmov_clave_mov) hacer 
                ract.precip:= ract.precip + rmov.precip; 
                avanzar_mov;
            fin_mientras

            esc(act, ract);

        sino 
            // quiere decir que está en manteniemiento //
            cont_ma:= cont_ma + 1;
            
            rindie.pluv_id:= rmov.pluv_id;
            leer(indie, rindie);            

            si EXISTE entonces 
                esc('ID de pluviómetro en mantenimiento es ', rindie.pluv_id);
                esc('El nombre del depto es ', arr[rindie.depto]);
            sino 
                esc('No se halló el dpto del pluviómetro ', rmov.pluv_id);
            fin_si 

            mientras (rmae.pluv_id = rmov.pluv_id) hacer 
                avanzar_mov;
            fin_mientras
           
        fin_si

    fin_procedimiento 

    procedimiento mae_menor ES;
    proceso 
        ract:= rmae;
        esc(act, ract);
        avanzar_mae;
    fin_procedimiento

    procedimiento iguales ES;
    proceso 
    si (rmov.est_pluv = 'AC') entonces 
            ract:= rmae;
            ract.precip:= ract.precip + rmov.precip;

            avanzar_mov;

            mientras (ract.clave_mae = rmov_clave_mov) hacer 
                ract.precip:= ract.precip + rmov.precip; 
                avanzar_mov;
            fin_mientras

            avanzar_mae;
            esc(act, ract);

        sino 
            // quiere decir que está en manteniemiento //
            cont_ma:= cont_ma + 1;
            ract:= rmae;
            esc(act, ract);
            
            rindie.pluv_id:= rmov.pluv_id;
            leer(indie, rindie);            

            si EXISTE entonces 
                esc('ID de pluviómetro en mantenimiento es ', rindie.pluv_id);
                esc('El nombre del depto es ', arr[rindie.depto]);
            sino 
                esc('No se halló el dpto del pluviómetro ', rmov.pluv_id);
            fin_si 

            mientras (rmae.pluv_id = rmov.pluv_id) hacer 
                avanzar_mov;
            fin_mientras
            
            avanzar_mae;
        fin_si

    fin_procedimiento  

Proceso 
    cargar_arr;

    abrir e/(mae);
    abrir e/(mov);
    abrir e/(indie);
    abrir /s(act);

    avanzar_mae;
    avanzar_mov;
    
    cont_ma:= 0;
    
    mientras (rmae.clave_mae <> HV) o (rmov.clave_mov <> HV) hacer 
    
        si (rmae.clave > rmov.clave_mov) entonces
            mae_mayor;
        sino
            si (rmae.clave < rmov.clave_mov) entonces
                mae_menor;
            sino
                // son iguales // 
                iguales;
            fin_si
        fin_si
    
    fin_mientras
    
    esc('Hay ', cont_ma, ' pluviómetros en mantenimiento.');
    
    cerrar(mae);
    cerrar(mov);
    cerrar(indie);
    cerrar(act);
Fin_Acción.