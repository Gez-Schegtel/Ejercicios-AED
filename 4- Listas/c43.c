

acción c43 (prim, ult: puntero a nodoE) es;
ambiente
    nodoE = registro
        nombre: an(50);
        capital: an(50);
        cant_hab: entero;
        cant_ana: entero;
        prox: puntero a nodoE;
        ant: puntero a nodoE;
    fin_registro

    p: puntero a nodoE;

    nodoS = registro
        nombre: an(50);
        capital: an(50);
        cant_hab: entero;
        cant_ana: entero;
        prox: puntero a nodoS;
    fin_registro

    primq, q, r, rr: puntero a nodoS;

    procedimiento nuevo_q es;
        nuevo(q);
        *q.nombre:= *p.nombre;
        *q.capital:= *p.capital;
        *q.cant_hab:= *p.cant_hab;
        *q.cant_ana:= *p.cant_ana;
    fin_procedimiento

    procedimiento cargar_sally es;
        nuevo_q();
        rr:= NIL;
        r:= primq;
        mientras (r <> NIL) y (*r.cant_ana < *q.cant_ana) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            *q.prox:= primq;
            primq:= q;
        sino
            *q.prox:= r;
            *rr.prox:= q;
        fin_si
    fin_procedimiento

proceso
    primq:= NIL;
    p:= prim;
    mientras (p <> NIL) hacer
        cargar_sally();
        p:= *p.prox;
    fin_mientras
fin_acción.
