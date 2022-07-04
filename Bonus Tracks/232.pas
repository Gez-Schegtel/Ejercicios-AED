Ejercicio 2.3.2

Una empresa dispone de un fichero secuencial con datos de sus empleados, ordenado por número de sucursal, y categoría, con los siguientes datos:

EMPLEADOS Ordenado por Nro_Sucursal, Categoria

    Nro_Sucursal Categoria (A,B,C) Nombre_Empleado Cod_Curso Tecnico (si,no) 

Y un fichero con datos de cursos, indexado por código de curso:

CURSO Indexado por Cod_Curso

    Cod_Curso Nombre Fecha Cant_Horas 

Emitir un listado informando:

    Para cada empleado: sucursal, categoría, nombre del empleado y nombre del curso que debe realizar.
    Por sucursal, categoría y toda la empresa:
        Total empleados técnicos
        Total empleados no técnicos
        Total empleados


Acción 232 ES;
Ambiente 
    empleados = registro
        nro_suc: n(3);
        categ: ('a','b','c');
        name_emp: an(40);
        cod_cur:n(3);
        tecn:('s','n');
    fin_registro
    
    arch: archivo ordenado por nro_suc y categ;
    reg: empleados;
    
    fecha =registro 
        aaaa: n(4); 
        mm: 1..12;
        dd: 1..31;
    fin_registro

    curso = registro 
        cod_cur: n(3);
        nombre: an(40);
        c_fech: fecha;
        cant_hs: n(2);
    fin_registro 
    
    arch2: archivo de curso indexado por cod_cur;
    reg2: curso;

    contec: entero;
    contnt: entero;

Proceso
    abrir e/(arch);
    abrir e/(arch2);

    leer(arch, reg);

    contec:= 0;
    contnt:= 0;

    mientras NFDA(arch) hacer 
        
        reg2.cod_cur:= reg.cod_cur;
        leer(arch2, reg2);

        si EXISTE entonces
            // Por empleado // 
            esc('Nombre del empleado es', reg2.nombre);
            esc('Curso a realizar >> ', reg.nro_curso )
            esc('Sucursal >> ', reg.nro_suc);
            esc('Categoría >>', reg.categ);

            si (reg.tecn = 's') entonces
                contec:= contec + 1;
            sino 
                contnt:= contnt + 1;
            fin_si

        sino 
            esc('No se encontró el curso correspondiente.');
        fin_si 

        leer(arch, reg);
    fin_mientras 

    esc('Total de empleados técnicos >> ', contec);
    esc('Total de empleados no técnicos >> ', contnt);
    esc('Total de empleados >> ', contec + contnt);

    cerrar(arch);
    cerrar(arch2);
Fin_Acción.

// Es con corte, pero no lo vamos a hacer // 

