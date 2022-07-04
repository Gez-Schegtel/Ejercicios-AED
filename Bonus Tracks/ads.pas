
Acción asd ES;
Ambiente 
    socios = registro 
        dni: n(8)
        ape_nom: an(30)
        edad: 18..80
        ciudad: an(30)
        deudor: ('si', 'no')
        cantidad_de_préstamos: n(2)
    fin_registro 

    arch_socios: archivo de socios indexado por dni 
    reg_socios: socios 

    libros = registro 
        id: (1..100)
        título: an(30)
        género: n(2)
        disponible: booleano
    fin_registro 

    arch_libros: archivo de libros indexado por id 
    reg_libros: libros 

    fecha = registro 
        anio: n(4)
        mes: 1..12
        dia: 1..31
    fin_registro 

    préstamos = registro 
        id_préstamo: n(8) 
        dni_socio: n(8)
        id_libro: n(8) 
        fecha_préstamo: fecha
        fecha_devolución: fecha
        devolución: ('si', 'no')
    fin_registro  

    arch_préstamo: archivo de préstamos indexado por id_préstamo
    reg_préstamo: préstamos 

    arr_libros: arreglo [1..100] de an(30)
    x: entero

    dni_soc: n(8)
    título_lib: an(30)

    posicion: entero

    cont: entero

    apynom: an(30)
    ed: 18..80
    ciud: an(30)

    total_préstamos: entero
    total_socios: entero

Proceso 
    abrir e/s(arch_socios)
    abrir e/s(arch_libros)
    abrir /s(arch_préstamo)

    esc('quiere comenzar? s/n')
    leer(op)

    cont:= 0
    total_préstamos:= 0
    total_socios:= 0
    
    mientras (op = s) hacer 

        esc('Ingrese el dni del socio y el título del libro')
        leer(dni_soc)
        leer(título_lib)

        posicion:= 1;
        mientras (posicion < 100) y (arr_libros[posicion] <> título_lib) hacer 
            posicion:= posicion + 1;
        fin_mientras

        reg_libros.id:= posicion;
        leer(arch_libros, reg_libros)
        
        si EXISTE y (arr_libros[posicion] = título_lib) y (reg_libros.disponible = verdadero) entonces
            esc('Se encontró el libro en la posición ', posicion);

            reg_socios.dni:= dni_soc;
            leer(arch_socios, reg_socios)

            si EXISTE entonces 
                reg_préstamo.id_préstamo:= cont + 1;
                reg_préstamo.dni_socio:= dni_soc
                reg_préstamo.id_libro:= posicion
                reg_préstamo.fecha_préstamo:= fecha_actual()

                si (reg_socios.cantidad_de_préstamos > 10) y (reg_socios.deudor = 'no') entonces 
                    reg_préstamo.fecha_devolución:= fecha_actual() + 20
                sino 
                    reg_préstamo.fecha_actual:= fecha_actual() + 14
                fin_si 

                reg_préstamo.devolución:= 's'

                esc(arch_préstamo, reg_préstamo)

                total_préstamos:= total_préstamos + 1

                reg_libros.disponible:= 'n'
                esc(arch_libros, reg_libros);

            sino    
                esc('ingrese apellido y nombre')
                leer(apynom)
                esc('ingrese edad')
                leer(ed)
                esc('ingrese ciudad')
                leer(ciud)
                
                reg_socios.dni:= dni_soc
                reg_socios.ape_nom:= apynom 
                reg_socios.edad:= ed 
                reg_socios.ciudad:= ciud 
                reg_socios.deudor:= 'n'
                cantidad_de_préstamos:= 1

                esc(arch_socios, reg_socios)

                total_socios:= total_socios + 1

                reg_préstamo.id_préstamo:= cont + 1;
                reg_préstamo.dni_socio:= dni_soc
                reg_préstamo.id_libro:= posicion
                reg_préstamo.fecha_préstamo:= fecha_actual()
                reg_préstamo.fecha_actual:= fecha_actual() + 14
                reg_préstamo.devolución:= 's'

                esc(arch_préstamo, reg_préstamo)

                total_préstamos:= total_préstamos + 1

            fin_si 
        
            
        sino
            esc('No se encontró el libro solicitado.');
        fin_si 

        ('realizar otro préstamo? s/n')
        leer(op)
    fin_mientras 

    cerrar(arch_socios)
    cerrar(arch_libros)
    cerrar(arch_préstamo)

Fin_Acción.