
Se desea ingresar una serie de números, e imprimirlos en el orden contrario al de ingreso. Diseñar un algoritmo que satisfaga tal requerimiento, utilizando la estructura de datos más apropiada.

/* Primer opción: Cargar como lista apilada */
acción 414 ES;
ambiente
    NODO = registro
        num: N(5);
        prox: puntero a NODO;
    fin_registro

    op: ('S, 'N');
    op: N(5);
    p, q, primq:= puntero a NODO;

proceso
    esc('¿Desea comenzar el proceso? S/N');
    leer(op);

    primq:= NIL;

    mientras (op = 'S') hacer

        nuevo(q);
        esc('Ingrese un dato >> ');
        leer(*q.num);
        *q.prox:= primq;
        primq:= q;

        ('¿Desea ingresar otro número? S/N');
        leer(op);
    fin_mientras

    p:= primq;
    mientras (p <> NIL) hacer
        esc(*p.num);
        p:= *p.prox;
    fin_mientras

fin_acción.


LEER (valor)

/* Segunda opción: Listas doblemente enlazadas */

acción 414 ES;
ambiente

    NODO = registro
        num: N(5);
        prox: puntero a NODO;
        ant: puntero a NODO;
    fin_registro

    p,q,ultq,primq: puntero a NODO;
    op: ('S','N');
    cont: N(5);

    procedimiento cargar_lista() ES;
        nuevo(q);
        esc('Ingrese un número');
        leer(*p.num);

        si (primq = NIL) entonces
            primq:= q;
            ultq:= q;
            *ultq.prox:= NIL;
            *primq.ant:= NIL;
            p:= primq;
        sino
            *p.prox:= q;
            *q.ant:= p;
            ultq:= q;
            *ultq.prox:= NIL;
            p:= q;
        fin_si
    fin_procedimiento

    procedimiento mostrar_lista() ES;
        p:= ultq;
        Mientras (p <> NIL) hacer
            esc('El número actual es >> ', *p.num);
            p:= *p.ant;
        fin_mientras
    fin_procedimiento

proceso
    primq:= NIL;
    ultq:= NIL;
    esc('¿Desea ingresar un número, ¿S/N?');
    leer(op);

    Mientras (op = 'S') hacer

        cargar_lista();

        esc('¿Desea ingresar otro número?, S/N');
        leer(op);
    fin_mientras

    mostrar_lista();

fin_acción.
