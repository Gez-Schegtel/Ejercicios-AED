
acción 412 es;
ambiente
    nodo = registro
        nya: an(40);
        est: ('p', 'e');
        dir: an(40);
        tel: n(8);
        tot: real;
        prox: puntero a nodo;
        ant: puntero a nodo;
    fin_registro

    op1: (1..3);
    op2: ('s', 'n');

    primq, ultq, q, r, rr: puntero a nodo;

    unya: an(40);
    udir: an(40);

    procedimiento nuevo_q es;
        nuevo(q);
        esc('Nombre >> ');
        leer(*q.nya);
        *q.est:= 'p';
        esc('Dirección >> ');
        leer(*q.dir);
        esc('Teléfono >> ');
        leer(*q.tel);
        esc('Total >> ');
        leer(*q.tot);
    fin_procedimiento

    procedimiento registrar_pedido es;
        nuevo_q();

        rr:= NIL;
        r:= primq;
        mientras (r <> NIL) y (*r.nya < *q.nya) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        /* Único o primer elemento. */
        si (rr = NIL) entonces
            *q.ant:= NIL;
            *q.prox:= primq;
            si (primq <> NIL) entonces
                *primq.ant:= q;
            fin_si
            primq:= q;
        sino
            /* Último elemento. */
            si (r = NIL) entonces
                *q.ant:= rr;
                *rr.prox:= q;
                *q.prox:= NIL;
            sino
                /* Elemento del medio. */
                *rr.prox:= q;
                *q.ant:= rr;
                *q.prox:= r;
                *r.ant:= q;
            fin_si
        fin_si

        /* Verificamos si es necesario actualizar el puntero externo al último elemento. */
        si (*q.prox = NIL) entonces
            ultq:= q;
        fin_si
    fin_procedimiento

    procedimiento buscar_pedido es;
        /* Voy a pedir dos datos, porque interpreto que la misma persona puede tener varios trabajos pendientes. */
        esc('Ingrese los datos del envío: ');
        esc('Nombre del delivery >> ');
        leer(unya);
        esc('Dirección de la entrega >> ');
        leer(udir);

        r:= primq;
        mientras (r <> NIL) y (*r.nya <> unya) y (*r.dir <> udir) hacer
            r:= *r.prox;
        fin_mientras
    fin_procedimiento

    procedimiento realizar_envio es;
        buscar_pedido();

        si (r <> NIL) entonces
            *r.est:= 'e';
        sino
            esc('Error, no se encontró el pedido.');
        fin_si
    fin_procedimiento

    procedimiento registrar_cobro es;
        buscar_pedido();

        si (r <> NIL) entonces
            si (r = primq) entonces
                primq:= *primq.prox;
                *primq.ant:= NIL;
            sino
                si (r = ultq) entonces
                    *(*r.ant).prox:= NIL;
                    ultq:= *r.ant;
                sino
                    *(*r.ant).prox:= *r.prox;
                    *(*r.prox).ant:= *r.ant;
                fin_si
            fin_si
            disponer(r);
        sino
            esc('Error, no se encontró el pedido.');
        fin_si
    fin_procedimiento

proceso
    primq:= NIL;
    repetir
        esc('Ingrese la operación que desee realizar.');
        esc('1- Registrar pedido.');
        esc('2- Realizar envío.');
        esc('3- Registrar cobro.');
        leer(op1);

        según (op1) hacer
            1:  registar_pedido();
            2:  realizar_envio();
            3:  registrar_cobro();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.
