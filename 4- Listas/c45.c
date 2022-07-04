
/* No entendí bien lo de actualizar deudor y qué sé yo. */
/* No hice prueba de escritorio de este ejercicio. */

acción c45 (prim: puntero a nodoE) es;
ambiente
    nodoE = registro
        nro_cli: n(4);
        nro_ped: n(4);
        pre_ped: n(5);
        tip_ped: ('c', 'r');
        prox: puntero a nodoE;
    fin_registro

    p: puntero a nodoE;

    nodoS = registro
        nro_cli: n(4);
        tot_ped: n(5);
        prox: puntero a nodoS;
    fin_registro

    q, primq_d, primq_nd, rq_d, rq_nd: puntero a nodoS;

    cliente = registro
        nro_cli: n(4);
        dni: n(8);
        dom: an(50);
        din_deu: n(5);
        deudor: ('s', 'n');
        baja: ('s', 'n');
    fin_registro

    a: archivo de cliente indexado por nro_cli;
    r: cliente;

    acuml: n(5);
    pedidos_r: n(5);

    procedimiento sumatorias es;
        si (*p.tip_ped = 'r') entonces
            pedidos_r:= pedidos_r + *p.pre_ped;
        fin_si
        acuml:= acuml + *p.pre_ped;
    fin_procedimiento

    procedimiento nuevo_q es;
        nuevo(q);
        *q.nro_cli:=r.nro_cli;
        *q.tot_ped:= acuml;
        *q.prox:= NIL;
    fin_procedimiento

    procedimiento carga_deudor es;
        nuevo_q();
        si (primq_d = NIL) entonces
            primq_d:= q;
        sino
            *rq_d.prox:= q;
        fin_si
        rq_d:= q;
    fin_procedimiento

    procedimiento carga_ndeudor es;
        nuevo_q();
        si (primq_nd = NIL) entonces
            primq_nd:= q;
        sino
            *rq_nd.prox:= q;
        fin_si
        rq_nd:= q;
    fin_procedimiento

proceso
    abrir e/s(a);

    primq_d:= NIL;
    primq_nd:= NIL;
    p:= prim;

    mientras (p <> NIL) hacer

        r.nro_cli:= *p.nro_cli;
        leer(a);

        si existe entonces

            acuml:= 0;
            pedidos_r:= 0;

            mientras (*p.prox <> NIL) y (*p.nro_cli = *(*p.prox).nro_cli) hacer
                sumatorias();
                p:= *p.prox;
            fin_mientras
            sumatorias();

            si (r.baja = 's') entonces
                r.baja:= 'n';
            fin_si

            si (pedidos_r > 0) entonces
                r.din_deu:= r.din_deu + pedidos_r;
                r.deudor:= 's';
            fin_si

            si (r.deudor = 's') entonces
                carga_deudor();
            sino
                carga_ndeudor();
            fin_si

        sino
            esc('El cliente en la lista no existe en el archivo.');
        fin_si

        p:= *p.prox;
    fin_mientras

    cerrar(a);
fin_acción.
