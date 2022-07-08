
Ejercicio 2.2.23

Una empresa de distribución de energía eléctrica posee un archivo maestro con los siguientes datos de sus clientes (la fecha de última lectura son las mediciones realizadas hasta el mes de mayo del 2014):

CLIENTE Ordenado por id_casa

    id_casa f_ult_lec c_lect prom_lecturas type_cr 

El campo tipo de consumidor puede ser:

    A (cuando el promedio de lectura es menor a 20K)
    B (cuando el promedio de lectura es menor a 40K)
    C (cuando el promedio de lectura es igual o supera los 40K)

Cuenta además con el siguiente archivo con datos de las mediciones realizadas en los dos últimos años (desde junio del 2014 hasta junio del 2016)

Mediciones Ordenado por id_casa

    id_casa Fecha_Medicion consumo 

Se pide actualizar el archivo maestro con la información de las lecturas hasta el mes de enero del año 2015 inclusive. Los campos que se deben actualizar son: la fecha de ultima lectura, cantidad de lecturas, el promedio y modificar (en caso de ser necesario) el tipo de consumidor. En caso en que no exista el ID casa (una conexión nueva) se tiene que crear en el maestro y actualizar los otros campos. 

Acción 2.2.23
Ambiente
    fecha = registro
        aaaa: n(4);
        mm: 1..12;
        dd: 1..31;
    fin_registro 

    cliente = registro
        id_casa: N(5)
        f_ult_lec: fecha
        c_lect: N(2)
        prom_lecturas: N(2)
        type_cr: ('A','B','C')
    fin_registro
    
    mae: archivo de cliente ordenado por id_casa;
    rmae: cliente;

    sally: archivo de cliente ordenado por id_casa;
    rsally: cliente; 

    medición = registro 
        id_casa: N(5);
        f_med: fecha;
        consumo: n(4);
    fin_registro 

    mov: archivo de medición ordenado por id_casa;
    rmov: medición;

    procedimiento avanzar_mae ES;
    proceso 
        leer(mae,rmae)
        si FDA (mae) entonces
            rmae.id_casa:= HV
        fin_si    
    fin_procedimiento

    procedimiento avanzar_mov ES; 
    proceso 
        leer(mov, rmov);

        si FDA(mov) entonces
            rmov.id_casa:= HV;
        fin_si 
    fin_procedimiento
    
    procedimiento mae_menor ES;
    proceso
        // Maestro sin cambios // Lo que no es lo mismo que maestro no tengo cambio // 
        rsally:= rmae;
        esc(sally, rsally);
    fin_procedimiento

    procedimiento mae_mayor ES;
    proceso
        si (rmov.f_med.aaaa < 2015) o (rmov.f_med.aaaa = 2015) y (rmov.f_med.mm = 1)
            rsally.id_casa:= rmov.id_casa;
            rsally.c_lect:= 0;
            rsally.prom_lecturas:= 0;

                mientras (rsally.id_casa = rmov.id_casa) hacer
                    rsally.f_ult_lec:= rmov.f_med;
                    rsally.c_lect:= rsally.c_lect + 1;
                    rsally.prom_lecturas:= (rsally.prom_lecturas + rmov.consumo);

                    avanzar_mov;
                fin_mientras

                rsally.prom_lecturas:= rsally.prom_lecturas / rsally.cant_lec;

                según (rsally.prom_lecturas) hacer 
                    <20000: rsally.type_cr:= 'A';
                    <40000: rsally.type_cr:= 'B';
                    >= 40000: rsally.type_cr:= 'C';
                fin_según

            esc(sally, rsally);
        sino

            rsally.id_casa:= rmov.id_casa;

            mientras (rsally.id_casa = rmov.id_casa) hacer
                avanzar_mov;
            fin_mientras 
        fin_si 
    
    fin_procedimiento

	procedimiento master_eq_move ES;
	proceso
        si (rmov.f_med.aaaa < 2015) o (rmov.f_med.aaaa = 2015) y (rmov.f_med.mm = 1) entonces
            rsally:= rmae;
                mientras (rsally.id_casa = rmov.id_casa) hacer
                    rsally.f_ult_lec:= rmov.f_med;
                    rsally.c_lect:= rsally.c_lect + 1;
                    rsally.prom_lecturas:= (rsally.prom_lecturas + rmov.consumo);

                    avanzar_mov;
                fin_mientras

                rsally.prom_lecturas:= rsally.prom_lecturas / rsally.cant_lec;

                según (rsally.prom_lecturas) hacer 
                    <20000: rsally.type_cr:= 'A';
                    <40000: rsally.type_cr:= 'B';
                    >= 40000: rsally.type_cr:= 'C';
                fin_según

            esc(sally, rsally);
        sino

            rsally.id_casa:= rmov.id_casa;

            mientras (rsally.id_casa = rmov.id_casa) hacer
                avanzar_mov;
            fin_mientras 
        fin_si 
	fin_procedimiento
    
Proceso
    abrir e/(mae);
    abrir e/(mov);
    abrir /s(sally);

    avanzar_mae;
    avanzar_mov;
    
    mientras (rmae.id_casa <> HV) o (rmov.id_casa <> HV) hacer 

        si (rmae.id_casa < rmov.id_casa) entonces
            mae_menor;
            avanzar_mae;
        sino
            si (rmae.id_casa > rmov.id_casa) entonces
                mae_mayor;
                avanzar_mov;
            sino
                // son iguales //
                mae_igual;
                avanzar_mae;
                avanzar_mov;
            fin_si
        fin_si 
   
    fin_mientras 

    cerrar(mae);
    cerrar(mov);
    cerrar(sally);
Fin_Acción