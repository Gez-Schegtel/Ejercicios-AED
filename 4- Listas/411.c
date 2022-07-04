

/* No entendí muy bien la consigna de este ejercicio... */

acción 411 es;
ambiente
    persona = registro
        dni: n(8);
        nya: an(40);
        anti: n(2);
    fin_registro

    a: archivo de persona ordenado por dni;
    r: persona;

    personal = registro
        anti: n(2);
        dni: n(4);
        nya: an(40);
        asig: n(5);
        prox: puntero a personal;
        ant: puntero a personal;
    fin_registro

    q, primq, ultq, r, rr: puntero a personal;

    procedimiento nuevo_q es;
        nuevo(q);
        *q.anti:= r.anti;
        *q.dni:= r.dni;
        *q.nya:= r.nya;
        *q.asig:= 0;

        /* Carga ordenada por antigüedad. */
        rr:= NIL;
        r:= primq;
        mientras (r <> NIL) y (*r.anti > *q.anti) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        /* Se inserta antes del primer elemento, o el único. */
        si (rr = NIL) entonces
            *q.prox:= primq;
            *q.ant:= NIL;

            si (primq <> NIL) entonces
                *primq.ant:= q;
            fin_si

            primq:= q;
        sino
            /* Inserción del último elemento. */
            si (r = NIL) entonces
                *q.ant:= rr;
                *rr.prox:= q;
                *q.prox:= NIL;
            sino
                /* En el medio. */
                *q.ant:= *r.ant;
                *(*r.ant).prox:= q;
                *q.prox:= r;
                *r.ant:= q;
            fin_si
        fin_si

        si (*q.prox = NIL) entonces
            ultq:= q;
        fin_si

    fin_procedimiento

    op: ('s', 'n');
    udni: n(8);

proceso
    abrir(a);
    leer(a, r);

    primq:= NIL;
    mientras NFDA(a) hacer
        nuevo_q();
        leer(a, r);
    fin_mientras

    esc('¿Desea realizar una asignación? s/n');
    leer(op);

    mientras (op = 's') hacer
        esc('Ingrese el DNI del personal al que que desee asignar un pedido: ');
        leer(udni);

        r:= primq;
        mientras (r <> NIL) y (*r.dni <> udni) hacer
            r:= *r.prox;
        fin_mientras

        si (r <> NIL) entonces
            esc('Ingrese la asignación: ');
            leer(*q.asig);

            si (r = primq) entonces
                /* Es el primer nodo. */
                primq:= *primq.prox;
                *primq.ant:= NIL;
            sino
                /* Uno del medio. Si toca el último, no se hace nada. */
                si (r <> ultq) entonces
                    *(*r.ant).prox:= *r.prox;
                    *(*r.prox).ant:= *r.ant;
                fin_si
            fin_si
            *ultq.prox:= r;
            *r.ant:= ultq;
            ultq:= r;
            *ultq.prox:= NIL;
        sino
            esc('Error, no se encontró el DNI solicitado.');
        fin_si

        esc('¿Desea realizar otra asignación? s/n');
        leer(op);
    fin_mientras

    r:= primq;
    mientras (r <> NIL) hacer
        esc('DNI: ', *r.dni);
        esc('Nombre: ', *r.nya);
        esc('Asignaciones: ', *r.asig);
        r:= *r.prox;
    fin_mientras

    cerrar(a);
fin_acción
