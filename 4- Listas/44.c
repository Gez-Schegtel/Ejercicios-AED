
acción 44 (prim: puntero a nodo) es;
ambiente

    nodo = registro
        dato1: entero;
        dato2: alfanumérico;
        prox: puntero a nodo;
    fin_registro

    p, primq, q: puntero a nodo;

proceso
    /* No voy a considerar si está vacía la lista. */

    primq:= NIL;
    p:= prim;
    mientras (p <> NIL) hacer
        nuevo(q);
        *q.dato1:= *p.dato1;
        *q.dato2:= *p.dato2;

        *q.prox:= primq;
        primq:= q;

        p:= *p.prox;
    fin_mientras

    /* Muestro la pila */
    /* q:= primq; <<~~ No hace falta porque en la carga apilada queda así por defecto al terminar */

    mientras (q <> NIL) hacer
        esc('Dato 1: ', *q.dato1);
        esc('Dato 2: ', *q.dato2);

        q:= *q.prox;
    fin_mientras
fin_acción.
