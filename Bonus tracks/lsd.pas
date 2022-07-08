

Acción lsd ES;
Ambiente
    fecha = registro 
        aaaa: n(4)
        mm: 1..12
        dd: 1..31
    fin_registro 

    reclamos = registro 
        región: N(2)
        codrecl: n(10)
        f_recl: fecha 
        mailcliente: AN(20)
        urgencia: ('A','B','M')
        detalle: AN(100)
    fin_registro 

    archrecl: archivo de reclamos ordenado por region y codrecl
    regrecl: reclamos 

    reporte = registro 
        region: n(2)
        ultfecrec: fecha
        urgalta: n(6)
        urgmedia: n(6) 
        urgbaja: n(6)
        nueaud: ('s', 'n')
    fin_registro 

    archrep: archivo de reporte indexado por region 
    regrep: reporte 

    arrreg: arreglo [1..20] de n(2)
    x: entero
    nueva_aud 

Proceso 
    carga_del_arreglo;

    abrir e/(archrecl)
    leer(archrecl, regrecl)

    abrir e/s(archrep)

    nueva_aud:= 0
    
    mientras NFDA(archrecl) hacer 
        regrep.region:= regrecl.region
        leer(archrep,regrep)
       
        Si EXISTE entonces
            si (regrecl.urgencia = 'A')
                regrep.urgalta:= regrep.urgalta + 1

            sino
                si (regrecl.urgencia = 'B')
                    regrep.urgbaja:= regrep.urgbaja + 1
                sino
                    regrep.urgmedia:= regrep.urgmedia + 1
                fin_si
            fin_si

            esc(archrep, regrep)
        
        sino
            esc('no se encontró, chau')        
            
        fin_si  

        leer(archrecl, regrecl)
    fin_mientras

    para x:= 1 hasta 20 hacer

        regrep.region:= x;
        leer(archrep,regrep)

        si EXISTE entonces 
            
            si (arreg[x] < 10) y (regrep.urgalta*2 > regrep.urgbaja) entonces 
                si regrep.nueaud <> 's' entonces
                    regrep.nueaud:= 's'
                fin_si

                arreg[x]:= arreg[x] + 1

                nueva_aud:= nueva_aud + 1
            fin_si 
            
        sino 
            ('No se encontró la región')
        fin_si 

    fin_para 
    
    esc('Se solicito una nueva auditoria ', nueva_aud, ' veces')
    
    cerrar(archrecl)
    cerrar(archrep)
Fin_Acción.