
acción 45 (prim: puntero a nodoE) es;
ambiente
    nodoE = registro
        tot_ana: entero;
        nombre: an(20);
        capital: an(20);
        tot_hab: entero;
        prox: puntero a nodoE;
    fin_registro
    p: puntero a nodoE;

    nodoS = registro
        por_ana: real;
        nombre: an(20);
        capital: an(20);
        prox: puntero a nodoS;
    fin_registro
    q, primq1, primq2, primq3, r, rr: puntero a nodoS;

    pp: real;

    procedimiento nuevo_q es;
        nuevo(q);
        *q.por_ana:= pp;
        *q.nombre:= *p.nombre;
        *q.capital:= *p.capital;
    fin_procedimiento

    procedimiento cargal1 es;
        nuevo_q();

        rr:= NIL;
        r:= primq3;
        mientras (r <> NIL) y (*r.por_ana > pp) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            *q.prox:= primq1;
            primq1:= q;
        sino
            *rr.prox:= q;
            *q.prox:= r;
        fin_si
    fin_procedimiento

    procedimiento cargal2 es;
        nuevo_q();

        rr:= NIL;
        r:= primq3;
        mientras (r <> NIL) y (*r.por_ana > pp) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            *q.prox:= primq2;
            primq2:= q;
        sino
            *rr.prox:= q;
            *q.prox:= r;
        fin_si
    fin_procedimiento

    procedimiento cargal3 es;
        nuevo_q();

        rr:= NIL;
        r:= primq3;
        mientras (r <> NIL) y (*r.por_ana > pp) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            *q.prox:= primq3;
            primq3:= q;
        sino
            *rr.prox:= q;
            *q.prox:= r;
        fin_si
    fin_procedimiento

proceso
    /* No voy a controlar si está vacía de entrada. */

    primq1:= NIL;
    primq2:= NIL;
    primq3:= NIL;
    p:= prim;

    /* Recorremos la lista de entrada. */
    mientras (p <> NIL) hacer
        pp:= (*p.tot_ana * 100) / tot_hab;

        si (pp <= 10) entonces
            cargal1();
        sino
            si (pp < 26) entonces
                cargal2();
            sino
                cargal3();
            fin_si
        fin_si

        p:= *p.prox;
    fin_mientras

fin_acción.
