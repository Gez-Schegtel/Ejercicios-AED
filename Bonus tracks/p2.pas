

Dada una lista doblemente encadenada que contiene datos de todas las provincias de la República Argentina: nombre, capital, cantidad total de habitantes y cantidad de analfabetos, y está ordenada alfabéticamente por nombre de provincia, se desea generar otra lista simplemente encadenada pero ordenada en orden decreciente por número de habitantes analfabetos.

acción 4.3.comp (ult,prim: puntero a NODO) ES;
ambiente

    NODO = registro
        prox: puntero a NODO;
        ult: puntero a NODO;
        name: an(50);
        cap: an(50);
        tot: n(9)
        analf: n(9)
    fin_registro

    p: puntero a NODO;

    simple = registro
        prox: puntero a NODO;
        name: an(50);
        cap: an(50);
        tot: n(9)
        analf: n(9)
    fin_registro

    primq,q,r,antq:= puntero a simple;

proceso

    si (prim = NIL) entonces
        esc('Error!, la lista está vacía.');
    sino
        p:= prim;
        primq:= NIL;

        mientras (*p.prox <> NIL) hacer
            nuevo(q);
            *q.name:= *p.name;
            *q.cap:= *p.cap;
            *q.tot:= *p.tot;
            *q.analf:= *p.analf;

            si (primq = NIL) entonces

                primq:= q;
                *q.prox:= NIL;

            sino

                r:= primq;

                mientras ((r <> NIL) o (*q.dato < *r.dato)) hacer
                    antq:= r;
                    r:= *r.prox;
                fin_mientras

                si ((r = NIL) o (*q.dato > *r.dato)) entonces
                    /* Insertamos en el medio o después del último nodo */
                    *antq.prox:= q
                    *q.prox:= r;
                sino
                    si (r = primq) entonces
                        /* Inseramos antes del primer elemento */
                        *q.prox:= primq;
                        primq:= q;
                    sino
                fin_si

            fin_si

            p:= *p.prox;
        fin_mientras
    fin_si

fin_acción.
