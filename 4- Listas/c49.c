
/*
No entendí bien la consigna de este ejercicio, pero voy a hacer lo siguiente...
Entiendo que vienen proyectos cargados, pero el usuario puede cargar nuevos también, para analizarlos después.
*/

acción c49 (primP: puntero a proyecto, primE: puntero a error) es;
ambiente
    fecha = registro
        aaaa: n(4);
        mm: (1..12);
        dd: (1..31);
    fin_registro

    proyecto = registro
        proy: an(20);
        resp: an(30);
        fch_ini: fecha;
        c_error: n(3);
    fin_registro

    q, rq: puntero a proyecto;

    error = registro
        desc_e: an(30);
        est: ('M', 'O', 'R');
    fin_registro

    e, re: puntero a error;

    op: ('s', 'n');
    i, errores, resueltos, tot_resueltos: entero;

    procedimiento nuevo_q es;
        nuevo(q);
        esc('Ingrese el nombre del proyecto: ');
        leer(*q.proy);
        esc('Ingrese el resp: '); /* No sé qué es resp xD */
        leer(*q.resp);
        esc('Ingrese la fecha de inicio: ');
        esc('Año >> '); leer(*q.fch_ini.aaaa);
        esc('Mes >> '); leer(*q.fch_ini.mm);
        esc('Día >> '); leer(*q.fch_ini.dd);
        esc('Ingrese la cantidad de errores: ');
        leer(*q.c_error);
        errores:= *q.c_error;
    fin_procedimiento

    procedimiento nuevo_e es;
        nuevo(e);
        esc('Ingrese la descripción del error: ');
        leer(*e.desc_e);
        esc('Ingrese el estado: M/O/R');
        leer(*e.est);
        *e.prox:= NIL;
    fin_procedimiento

    procedimiento cargar_proyectos es;
        esc('¿Desea cargar un nuevo proyecto a la lista? s/n');
        leer(op);

        mientras (op = 's') hacer
            nuevo_q();
            /* Primero, cargamos el proyecto. */
            /* La lista de proyectos es circular. */
            si (primP = NIL) entonces
                /* Vino vacía de entrada. */
                primP:= q;
                *q.prox:= q;
            sino
                /* Como en este caso los proyectos de la lista tienen correspondencia con la posición de los errores de la otra lista, no puedo insertar los nuevos proyectos en cualquier lugar. */
                rq:= primP;
                mientras (*rq.prox <> primP) hacer
                    rq:= *rq.prox;
                fin_mientras
                /* Insertamos el nuevo proyecto al final de lista. */
                *rq.prox:= q;
                *q.prox:= primP;
            fin_si

            /* Luego, cargamos los errores del mismo. Suponemos que al menos uno va a tener. */
            /* Esta lista es simplemente enlazada. */
            re:= primE;
            mientras (*re.prox <> NIL) hacer
                re:= *re.prox;
            fin_mientras

            para i:= 1 hasta errores hacer
                nuevo_e();

                si (primE = NIL) entonces
                    primE:= e;
                sino
                    *re.prox:= e;
                fin_si
                re:= e;
            fin_para

            esc('¿Desea ingresar otro proyecto?');
            leer(op);
        fin_mientras
    fin_procedimiento

    procedimiento control_resueltos es;
        si (*re.est = 'R') entonces
            resueltos:= resueltos + 1;
        fin_si
    fin_procedimiento

    procedimiento control_proyectos es;
        tot_resueltos:= 0;
        rq:= primP;
        re:= primE;

        /* Lo hago con un repetir por si hay un solo proyecto. */
        repetir
            resueltos:= 0;
            esc('Proyecto: ', *rq.proy);
            esc('¿Desea modificar el estado de los errores de este proyecto? s/n');
            leer(op);

            errores:= *rq.c_error;

            si (op = 'n') entonces
                para i:= 1 hasta errores hacer
                    control_resueltos();
                    re:= *re.prox;
                fin_para
            sino
                para i:= 1 hasta errores hacer
                    esc('Error: ', *re.desc_e);
                    esc('Estado actual: ', *re.desc_e);
                    esc('¿Desea cambiar el estado? s/n');
                    leer(op);

                    si (op = 's') entonces
                        esc('Ingrese el nuevo estado: M/O/R');
                        leer(*re.est);
                    fin_si
                    control_resueltos();
                    re:= *re.prox;
                fin_para
            fin_si

            si (resueltos = errores) entonces
                tot_resueltos:= tot_resueltos + 1;
            fin_si

            rq:= *rq.prox;
        hasta_que (*rq.prox = primP);

        esc('Número de proyectos con todos sus errores resueltos: ', tot_resueltos);
    fin_procedimiento

proceso
    repetir
        cargar_proyectos();
        si (primP <> NIL) entonces
                control_proyectos();
        sino
            esc('No se puede realizar el control de proyectos porque la lista está vacía.');
        fin_si

        esc('¿Desea repetir el proceso? s/n');
        leer(op);
    hasta_que (op = 'n');
fin_acción.
