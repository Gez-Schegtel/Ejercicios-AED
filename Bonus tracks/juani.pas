
Acción parci ES;
Ambiente 

    fecha = registro 
        aaaa: n(4)
        mm: 1..12
        dd: 1..31
    fin_registro 

    clave = registro 
        dni: n(8)
        sexo: ('m', 'f')
        nro_dosis: n(4)
    fin_registro 

    novedades = registro 
        clave_nov: clave
        f_aplicación: fecha 
        nym: an(30)
        id_vac: n(4)
        baja: booleano
        id_pcia: n(4)
    fin_registro 

    nov: archivo de novedades ordenado por dni sexo nro_dosis
    Rnov: novedades 

    vacunas = registro 
        id_vac: n(4)
        nombre_vac: an(30)
        cant_dosis: n(4)
    fin_registro 

    vac: archivo de vacunas indexado por id_vac
    Rvac: vacunas 
    
    personas = registro 
        clave_per: clave 
        nombre_vac: an(30)
        f_ult_modif: fecha 
        f_apli: fecha 
        id_pcia: n(4)
    fin_registro 

    
    mae, act: archivo de personas ordenado por dni sexo nro_dosis
    Rmae, Ract: personas 
    
    procedimiento leer_mae ES;
    proceso
        leer(mae, rmae)

        si FDA(mae) entonces 
            rmae.clave_per:= HV
        fin_si 
    fin_procedimiento

    procedimiento leer_nov ES;
    Proceso
        leer(nov, Rnov)

        si FDA(nov) entonces 
            Rnov.clave_nov:= HV
        fin_si 
    fin_procedimiento 

    procedimiento mae_menor es 
    proceso 
        // no tuvo movimientos la persona //
        ract:= rmae 
        esc(act, ract)
        leer_mae
    fin_proce 

    procedimiento mae_mayor es // solo es posible la alta // 
    proceso 
        
        si (rnov.baja = verdadero) entonces 
            esc('No es posible dar de baja a alguien que no está en el reg')
        sino 
            rvac.id_vac:= rnov.id_vac
            leer(vac, rvac)

            si existe entonces 

                ract.clave_per: rnov.clave_nov
                ract.nombre_vac: rvac.nombre_vac
                ract.f_ult_modif: sistema.fechahoy()
                ract.f_apli: rnov.f_apli
                ract.id_pcia: rnov.id_pcia

                esc(act, ract)

                según (rnov.clave_nov.nro_dosis) hacer 
                    1: cont_dosis1:= cont_dosis1 + 1
                       cant_dosis1:= cant_dosis1 + rvac.cant_dosis
                    
                    2: cont_dosis2:= cont_dosis2 + 1
                       cant_dosis2:= cant_dosis2 + rvac.cant_dosis
                fin_segun 
            
            sino 
                esc('No se pudo dar el alta pq no se encontró la vacuna')
            fin_si 

        fin_si 

        leer_nov
    fin_proce 

    procedimiento iguales ES;
    proceso 

        si (rnov.baja = verdadero) entonces 
            esc('Se dio de baja correctamente')
            cont_baja:= cont_baja + 1
        
        sino 
            rvac.id_vac:= rnov.id_vac
            leer(vac, rvac)

            si existe entonces 

                ract.clave_per: rnov.clave_nov
                ract.nombre_vac: rvac.nombre_vac
                ract.f_ult_modif: sistema.fechahoy()
                ract.f_apli: rnov.f_apli
                ract.id_pcia: rnov.id_pcia

                esc(act, ract)

                según (rnov.clave_nov.nro_dosis) hacer 
                    1: cont_dosis1:= cont_dosis1 + 1
                       cant_dosis1:= cant_dosis1 + rvac.cant_dosis
                    
                    2: cont_dosis2:= cont_dosis2 + 1
                       cant_dosis2:= cant_dosis2 + rvac.cant_dosis
                fin_segun
            
            sino 
                esc('No se pudo dar el alta pq no se encontró la vacuna')
            fin_si 
 

        leer_nov
        leer_mae
    fin_procedimiento 

    cont_baja: entero 

    cont_dosis1: entero
    cont_dosis2: entero

    cant_dosis1: entero
    cant_dosis2: entero

Proceso
    abrir e/(mae)
    abrir /s(act) //vamos a actualizar este 
    abrir e/(nov) // movimientos
    abrir e/(vac) //index

    leer_mae
    leer_nov

    cont_baja:= 0
    cont_dosis1:= 0
    cont_dosis2:= 0

    cant_dosis1:= 0
    cant_dosis2:= 0

    mientras (rmae.clave_per <> hv) o (rnov.clave_nov <> hv) hacer 

        si (rmae.clave_per < rnov.clave_nov) entonces 
            mae_menor
        sino
            si (rmae.clave_per > rnov.clave_per) entonces 
                mae_mayor
            sino 
                iguales;
            fin_si 
        fin_si 

    fin_mientras 

    si (cont_dosis1 > cont_dosis2) entonces 
        esc('Dosis con mayor número de novedades es la primera con', cont_dosis1, ' novedaes y ', cant_dosis1, ' de dosis aplicadas')
    sino 
        esc('Dosis con mayor número de novedades es la segunda con', cont_dosis2, ' novedaes y ', cant_dosis2, ' de dosis aplicadas')

    fin_si 

    esc('hubo', cont_baja, ' bajas')

    cerrar(mae)
    cerrar(act)
    cerrar(nov) 
    cerrar(vac)
Fin_Acción.