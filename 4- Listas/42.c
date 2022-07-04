

/* El enunciado dice que se asume que la lista está cargada, por lo que no voy a preguntar al principio por NIL*/
acción 42 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    p, a, q, primq, rq: puntero a nodo;

    procedimiento cargar es;
        nuevo(q);
        *q.dato:= *p.dato;
        *q.prox:= NIL;

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento borrar es;
        si (p = prim) entonces
            prim:= *p.prox;
            disponer(p);
            p:= prim;
        sino
            *a.prox:= *p.prox;
            disponer(p);
            p:= *a.prox;
        fin_si
    fin_procedimiento

proceso
    primq:= NIL;
    p:= prim;
    mientras (p <> NIL) hacer
        si (*p.dato mod 3 = 0) entonces
            cargar();
            borrar();
        sino
            a:= p;
            p:= *p.prox;
        fin_si
    fin_mientras
fin_acción.
