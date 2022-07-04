
/* Lista simplemente enlazada. */

acción 48 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        clave: n(4);
        info: an(45);
        prox: puntero a nodo;
    fin_registro

    r, rr, q: puntero a nodo;

    op1: (1..3);
    op2: ('s', 'n');

    uclave: n(4);

    procedimiento buscar es;
        esc('Ingrese una clave: ');
        leer(uclave);

        r:= prim;
        mientras (r <> NIL) y (*r.clave <> uclave) hacer
            r:= *r.prox;
        fin_mientras

        /* r <> NIL indica con total certeza que se encontró el elemento. */
        si (r <> NIL) entonces
            esc('La clave ', *r.clave, ' contiene la siguiente información: ', *r.info);
        sino
            esc('Error, no se ha encontrado la clave solicitada.');
        fin_si
    fin_procedimiento


    /* Inserción no ordenada por carga apilada. */
    /*
    procedimiento insertar es;
        nuevo(q);
        esc('Ingrese la clave del nuevo nodo: ');
        leer(*q.clave);
        esc('Ingrese la información que contendrá el nodo: ');
        leer(*q.info);

        *q.prox:= prim;
        prim:= q;
    fin_procedimiento
    */

    /* Inserción no ordenada por carga encolada. */
    /*
    procedimiento insertar es;
        nuevo(q);
        esc('Ingrese la clave del nuevo nodo: ');
        leer(*q.clave);
        esc('Ingrese la información que contendrá el nodo: ');
        leer(*q.info);

        rr:= NIL;
        r:= prim;
        mientras (r <> NIL) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            prim:= q;
        sino
            *rr.prox:= q;
        fin_si
        *q.prox:= NIL;
    fin_procedimiento
    */

    /* Inserción ordenada. */
    procedimiento insertar es;
        nuevo(q);
        esc('Ingrese la clave del nuevo nodo: ');
        leer(*q.clave);
        esc('Ingrese la información que contendrá el nodo: ');
        leer(*q.info);

        rr:= NIL;
        r:= prim;
        mientras (r <> NIL) y (*r.clave < *q.clave) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        /* rr = NIL indica con total certeza que hay que insertar el nodo como primer elemento. */
        si (rr = NIL) entonces
            *q.prox:= prim;
            prim:= q;
        sino
            *rr.prox:= q;
            *q.prox:= r;
        fin_si
    fin_procedimiento

    procedimiento borrar es;
        esc('Ingrese una clave: ');
        leer(uclave);

        rr:= NIL;
        r:= prim;
        mientras (r <> NIL) y (*r.clave <> uclave) entonces
            rr:= r;
            r:= *r.prox;
        fin_mientras

        /* Verificamos si se encontró el elemento. */
        si (r <> NIL) entonces
            /* Vemos si se trata del primer (también podría tratarse del único) elemento... */
            si (rr = NIL) entonces
                prim:= *prim.prox;
            sino
                /* ... o de alguno del medio o el último. */
                *rr.prox:= *r.prox;
            fin_si
            disponer(r);
        sino
            esc('Error, no se ha encontrado la clave solicitada.');
        fin_si
    fin_procedimiento

proceso
    repetir
        esc('Seleccione una operación... ');
        esc('1- Buscar.');
        esc('2- Insertar.');
        esc('3- Borrar.');
        leer(op1);

        según (op1) hacer
            1: buscar();
            2: insertar();
            3: borrar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.



/* Lista circular simplemente enlazada. */

acción 48 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        clave: n(4);
        info: an(45);
        prox: puntero a nodo;
    fin_registro

    r, rr, q, u:= puntero a nodo;

    op1: (1..3);
    op2: ('s', 'n');

    uclave: n(4);

    procedimiento buscar es;
        si (prim <> NIL) entonces
            esc('Ingrese una clave para iniciar la búsqueda.');
            leer(uclave);

            r:= prim;
            mientras (*r.prox <> prim) y (*r.clave <> uclave) hacer
                r:= *r.prox;
            fin_mientras

            si (*r.clave = uclave) entonces
                esc('La clave ', *r.clave, ' contiene la siguiente información: ', *r.info);
            sino
                esc('Error, no se encontró la clave solicitada.');
            fin_si
        sino
            esc('Error, la lista de entrada está vacía.');
        fin_si
    fin_procedimiento

    /* Inserción no ordenada. */
    procedimiento insertar es;
        nuevo(q);
        esc('Ingrese la clave para el nuevo nodo: ');
        leer(*q.clave);
        esc('Ingrese la información que contendrá: ');
        leer(*q.info);

        si (prim <> NIL) entonces
            *q.prox:= *prim.prox;
            *prim.prox:= q;
        sino
            prim:= q;
            *q.prox:= prim;
        fin_si
    fin_procedimiento

    procedimiento borrar es;
        /* Se verifica que no esté vacía de entrada. */
        si (prim <> NIL) hacer
            esc('Ingrese una clave para iniciar la búsqueda del nodo que desee borrar.');
            leer(uclave);

            r:= prim;
            mientras (*r.prox <> prim) y (*r.clave <> uclave) hacer
                rr:= r;
                r:= *r.prox;
            fin_mientras

            /* Se controla si se encontró la clave. */
            si (*r.clave = uclave) entonces
                /* Si se encontró, hay que ver en qué posición. */
                /* Único elemento. */
                si (*r.prox = r) entonces
                    prim:= NIL;
                sino
                    /* Primer elemento. */
                    si (r = prim) entonces
                        u:= prim;
                        mientras (*u.prox <> prim) hacer
                            u:= *u.prox;
                        fin_mientras

                        prim:= *prim.prox;
                        *u.prox:= prim;
                    sino
                        /* Elemento del medio o último. */
                        *rr.prox:= *r.prox;
                    fin_si
                fin_si
                disponer(r);
            sino
                esc('Error, no se ha encontrado la clave.');
            fin_si
        sino
            esc('Error, la lista está vacía.');
        fin_si
    fin_procedimiento

proceso
    repetir
        esc('Seleccione una operación... ');
        esc('1- Buscar.');
        esc('2- Insertar.');
        esc('3- Borrar.');
        leer(op1);

        según (op1) hacer
            1: buscar();
            2: insertar();
            3: borrar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.
