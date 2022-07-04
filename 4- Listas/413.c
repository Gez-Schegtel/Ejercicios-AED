
acción 413 (prim, ult: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
        ant: puntero a nodo;
    fin_registro

    r, rr: puntero a nodo;

    procedimiento depuracion es;
        r:= prim;
        mientras (*r.prox <> NIL) hacer
            si (*r.dato = *(*r.prox).dato) entonces
                si (r = prim) entonces
                    prim:= *prim.prox;
                    *prim.ant:= NIL;
                    disponer(r);
                    r:= prim;
                sino
                    *(*r.ant).prox:= *r.prox;
                    *(*r.prox).ant:= *r.ant;
                    rr:= *r.prox;
                    disponer(r);
                    r:= rr;
                fin_si
            sino
                r:= *r.prox;
            fin_si
        fin_mientras
    fin_procedimiento

proceso
    /* No voy a controlar si viene vacía de entrada. */
    r:= prim;
    mientras (*r.prox <> NIL) y (*r.dato <= *(*r.prox).dato) hacer
        r:= *r.prox;
    fin_mientras

    si (*r.prox <> NIL) entonces
        esc('Error, la lista está desordenada.');
    sino
        depuracion();
        esc('¡Depuración exitosa!');
    fin_si
fin_acción.
