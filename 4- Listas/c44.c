
/* No se especifica el tipo de carga, como tampoco si está ordenada o no */
/* la lista de entrada, por lo tanto, voy a realizar una carga encolada. */

/* Opción 1: De esta manera hay ciertos errores. Hacer la prueba de escritorio para darte cuenta porque no tengo ganas de explicarlo ahora. */
acción c44 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        num: n(4);
        nya: an(40);
        cond: ('a', 'b');
        prox: puntero a nodo;
    fin_registro

    r, rr, u, primq, q, rq: puntero a nodo;

    procedimiento cargar es;
        nuevo(q);
        *q.num:= *r.num;
        *q.nya:= *r.nya;
        *q.cond:= *r.cond;
        *q.prox:= NIL;

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        /* Primer elemento. */
        si (r = prim) entonces
            u:= prim;
            mientras (*u.prox <> prim) hacer
                u:= *u.prox;
            fin_mientras

            prim:= *prim.prox;
            *u.prox:= prim;
            disponer(r);
            r:= prim;
        sino
            /* Elemento del medio o final. */
            *rr.prox:= *r.prox;
            disponer(r);
            r:= *rr.prox;
        fin_si
    fin_procedimiento

proceso
    primq:= NIL;
    r:= prim;
    mientras (*r.prox <> prim) hacer
        si (*r.cond = 'a') entonces
            si (*r.num mod 100 = 0) entonces
                cargar();
            fin_si
            rr:= r;
            r:= *r.prox;
        sino
            si (*r.cond = 'b') entonces
                eliminar();
            fin_si
        fin_si
    fin_mientras
fin_acción.


/* Opción 2: Es la que va. */
acción c44 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        num: n(4);
        nya: an(40);
        cond: ('a', 'b');
        prox: puntero a nodo;
    fin_registro

    r, rr, u, primq, q, rq: puntero a nodo;

    procedimiento cargar es;
        nuevo(q);
        *q.num:= *r.num;
        *q.nya:= *r.nya;
        *q.cond:= *r.cond;
        *q.prox:= NIL;

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;
    fin_procedimiento

    procedimiento eliminar es;
        /* Primer elemento. */
        si (r = prim) entonces
            u:= prim;
            mientras (*u.prox <> prim) hacer
                u:= *u.prox;
            fin_mientras

            prim:= *prim.prox;
            *u.prox:= prim;
            disponer(r);
            r:= prim;
        sino
            /* Elemento del medio o final. */
            *rr.prox:= *r.prox;
            disponer(r);
            r:= *rr.prox;
        fin_si
    fin_procedimiento

    op: ('s', 'n');

proceso
    primq:= NIL;
    r:= prim;
    repetir
        si (*r.cond = 'a') entonces
            si (*r.num mod 100 = 0) entonces
                cargar();
            fin_si
            rr:= r;
            r:= *r.prox;
        sino
            si (*r.cond = 'b') entonces
                eliminar();
            fin_si
        fin_si

        esc('¿Desea continuar el proceso? s/n');
        leer(op);
    hasta_que (op = 'n');
fin_acción.
