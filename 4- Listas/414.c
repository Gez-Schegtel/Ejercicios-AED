
/* Opción 1: Carga apilada. Es la mejor opción. */
acción 414 es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    primq, q: puntero a nodo;

    op: ('s', 'n');

proceso
    primq:= NIL;
    repetir
        nuevo(q);
        *q.prox:= primq;
        primq:= q;

        esc('Ingrese un número: ');
        leer(*q.dato);

        esc('¿Desea ingresar otro número? s/n');
        leer(op);
    hasta_que (op = 'n');

    esc('Lista en orden contrario al ingreso: ');
    mientras (q <> NIL) hacer
        esc(*q.dato);
        q:= *q.prox;
    fin_mientras
fin_acción.


/* Opción 2: Listas doblemente enlazadas. Una poronga. */
acción 414 es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
        ant: puntero a nodo;
    fin_registro

    primq, ultq, q, rq: puntero a nodo;

    op: ('s', 'n');

proceso
    primq:= NIL;
    repetir
        nuevo(q);
        si (primq = NIL) entonces
            primq:= q;
            *q.ant:= NIL;
        sino
            *rq.prox:= q;
            *q.ant:= rq;
        fin_si
        *q.prox:= NIL;
        rq:= q;

        esc('Ingrese un número: ');
        leer(*q.dato);

        esc('¿Desea ingresar otro número? s/n');
        leer(op);
    hasta_que (op = 'n');

    ultq:= q;

    esc('Lista en orden contrario al ingreso: ');
    mientras (q <> NIL) hacer
        esc(*q.dato);
        q:= *q.ant;
    fin_mientras
fin_acción.
