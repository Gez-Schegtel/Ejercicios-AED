
acción c42 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    r, rr, primq, q, rq: puntero a nodo;

    procedimiento cargar es;
        nuevo(q);
        *q.dato:= *r.dato;
        *q.prox:= NIL;

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        si (r = prim) entonces
            prim:= *prim.prox;
            disponer(r);
            r:= prim;
        sino
            *rr.prox:= *r.prox;
            disponer(r);
            r:= *rr.prox;
        fin_si
    fin_procedimiento

proceso
    primq:= NIL;
    r:= prim;
    mientras (r <> NIL) hacer
        si (*r.dato mod 3 = 0) entonces
            cargar();
            eliminar();
        sino
            rr:= r;
            r:= *r.prox;
        fin_si
    fin_mientras
fin_acción.
