

/* Lista simplemente enlazada. */
acción 415 (primq: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    q, rq: puntero a nodo;
    op1: (1, 2);
    op2: ('s', 'n');
    udato: entero;

    procedimiento insertar es;
        nuevo(q);
        *q.prox:= NIL;
        esc('Ingrese el número que desea cargar en la lista: ');
        leer(*q.dato);

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        si (primq <> NIL) entonces
            esc('Ingrese el dato que desee eliminar.');
            leer(udato);

            rq:= NIL;
            q:= primq;
            mientras (q <> NIL) y (*q.dato <> udato) hacer
                rq:= q;
                q:= *q.prox;
            fin_mientras

            /* Verificamos si se encontró el elemento. */
            si (q <> NIL) entonces
                /* Ahora vemos si se trata del primer o único elemento... */
                si (rq = NIL) entonces
                    primq:= *primq.prox;
                sino
                    /* ... o si es alguno del medio o el último. */
                    *rq.prox:= *q.prox;
                fin_si
                disponer(q);
                esc('Elemento exitosamente eliminado.');
            sino
                esc('Error, no se ha encontrado el elemento.');
            fin_si
        sino
            esc('Error, no se puede eliminar un elemento. La lista está vacía.');
        fin_si

    fin_procedimiento

proceso
    repetir
        esc('Seleccione una opción: ');
        esc('1- Insertar.');
        esc('2- Eliminar.');
        leer(op1);

        según (op1) hacer
            1: insertar();
            2: eliminar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.




/* Lista doblemente enlazada. */
acción 415 (primq, ultq: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
        ant: puntero a nodo;
    fin_registro

    q, rq: puntero a nodo;
    udato: entero;
    op1: (1, 2);
    op2: ('s', 'n');

    procedimiento insertar es;
        nuevo(q);
        ultq:= q;
        *q.prox:= NIL;

        esc('Ingrese el número que desea agregar a la lista: ');
        leer(*q.dato);

        si (primq = NIL) entonces
            primq:= q;
            *q.ant:= NIL
        sino
            *rq.prox:= q;
            *q.ant:= rq;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        si (primq <> NIL) entonces
            esc('Ingrese el dato que desee eliminar: ');
            leer(udato);

            q:= primq;
            mientras (q <> NIL) y (*q.dato <> udato) hacer
                q:= *q.prox;
            fin_mientras

            si (q <> NIL) entonces
                si (q = primq) entonces
                    primq:= *primq.prox;
                    *primq.ant:= NIL;
                sino
                    si (q = ultq) entonces
                        ultq:= *ultq.ant;
                        *ultq.prox:= NIL;
                    sino
                        *(*q.ant).prox:= *q.prox;
                        *(*q.prox).ant:= *q.ant;
                    fin_si
                fin_si
                disponer(q);
            sino
                esc('Error, no se ha encontrado el dato solicitado.');
            fin_si
        sino
            esc('Error, la lista está vacía.');
        fin_si
    fin_procedimiento

proceso
    repetir
        esc('Seleccione una opción: ');
        esc('1- Insertar.');
        esc('2- Eliminar.');
        leer(op1);

        según (op1) hacer
            1: insertar();
            2: eliminar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción




/* Lista circular simplemente enlazada. */
acción 415 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    q, rq: puntero a nodo;
    udato: entero;
    op1: (1, 2);
    op2: ('s', 'n');

    procedimiento insertar es;
        nuevo(q);

        esc('Ingrese el número que desee agregar a la lista: ');
        leer(*q.dato);

        si (primq = NIL) entonces
            primq:= q;
            *q.prox:= q;
        sino
            *rq.prox:= q;
            *q.prox:= primq;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        si (primq <> NIL) entonces
            esc('Ingrese el número que desea borrar de la lista: ');
            leer(udato);

            q:= primq;
            mientras (*q.prox <> primq) y (*q.dato <> udato) hacer
                rq:= q;
                q:= *q.prox;
            fin_mientras

            si (*q.dato = udato) entonces
                /* Único elemento. */
                si (*q.prox = primq) entonces
                    primq:= NIL;
                sino
                    /* Primer elemento. */
                    si (q = primq) entonces
                        rq:= primq;
                        mientras (*rq.prox <> primq) hacer
                            rq:= *rq.prox;
                        fin_mientras

                        primq:= *primq.prox;
                        *rq.prox:= primq;
                    sino
                        /* Elemento del medio o final. */
                        *rq.prox:= *q.prox;
                    fin_si
                fin_si
                disponer(q);

            sino
                esc('Error, no se ha encontrado el dato solicitado.');
            fin_si
        sino
            esc('Error, la lista está vacía.');
        fin_si
    fin_procedimiento

proceso
    repetir
        esc('Seleccione una opción: ');
        esc('1- Insertar.');
        esc('2- Eliminar.');
        leer(op1);

        según (op1) hacer
            1: insertar();
            2: eliminar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.
