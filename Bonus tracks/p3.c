
Dada una lista circular con los datos de los socios de un club: número, nombre y condición ( ´A´= alta, ´B´= baja); hacer un algoritmo que cree otra lista simplemente encadenada con los socios múltiplos de 100, que no estén dados de baja y eliminar de la lista original los socios dados de baja ( cond = ´B´).

acción 4.4.c (prim: puntero a NODO) ES;

    NODO = registro
        num: N(8);
        name: AN(50);
        cond: ('A','B');
        prox: puntero a NODO;
    fin_registro

    p,ant: puntero a NODO;

    simple : registro
        num: N(8);
        name: AN(50);
        cond: ('A','B');
        prox: puntero a NODO;
    fin_registro

    primq,q: puntero a simple;

proceso

    si (prim = NIL) entonces
        esc('Error, lista vacía.');
    sino
        p:= prim;
        primq:= NIL;

        mientras ((*p.prox <> prim) o (prim <> NIL)) hacer

            si ((*p.num MOD 100 = 0) y (*p.cond = 'A')) entonces
                nuevo(q);
                *q.name:= *p.name;
                *q.num:= *p.num;
                *q.cond:= *p.cond;
                *q.prox:= NIL;

                si (primq = NIL) entonces
                    primq:= q;
                sino
                    *antq.prox:= q;
                fin_si
                antq:= q;

            sino
                si (*p.cond = 'B') entonces
                    si (*prim.prox = prim) entonces
                        /* Por si tenemos que borrar el único nodo de la lista */
                        disponer(prim);
                        prim:= NIL;
                    sino
                        *ant.prox:= *p.prox;
                        disponer(p);
                        p:= *ant.prox;
                fin_si
            fin_si

            ant:=p;
            p:=*p.prox
        fin_mientras

    fin_si

fin_acción,
