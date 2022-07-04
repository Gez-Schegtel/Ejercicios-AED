

El delivery de "Pedidos Ya" funciona de la siguiente manera: se dispone de un archivo secuencial con todos los pedidos del día, ordenados por código de pedido. De cada uno se ha almacenado los siguientes datos:

 Código Pedido | Domicilio de entrega | Persona que recibe | Costo de envio

 N(6)                AN(60)                 AN(60)              N(5.2)

La entrega se realiza de acuerdo al orden en que se hizo cada pedido, es decir el primer pedido que se registró es el primer pedido en ser atendido.

Se debe realizar un algoritmo que simule interactivamente la entrega de los pedidos, utilizando una lista. La misma se debe actualizar eliminando aquellos pedidos que han podido entregarse. Aquellos pedidos que no hayan podido ser entregados deben ser tratados nuevamente al finalizar el recorrido de la entrega, en el mismo orden. Un pedido que se haya intentado entregar 2 veces, sin éxito, deberá eliminarse de la lista de pedidos a entregar

Informar al final cuántos pedidos se entregaron en el día, cuántos no pudieron ser entregados y, de estos últimos, qué porcentaje representan los que se intentaron entregar 2 veces sin éxito. Suponiendo, además, que a la empresa cada vez que intenta entregar un pedido le genera un gasto de $55, ¿cuál fue el ganancia total de la empresa en el día?


acción mod_p ES;
ambiente

    pedido = registro
        cod_p: n(6);
        dom_ent: an(60);
        per: an(60);
        costo: n(5.2);
    fin_registro

    arch: archivo de pedido ordenado por cod_p;
    reg: cod_p;
    op,op2: ('S','N');

    nodo = registro
        cod_p: n(6);
        dom_ent: an(60);
        per: an(60);
        costo: n(5.2);
        intentos: (0..2);
        prox: puntero a NODO;
        ant: puntero a NODO;
    fin_registro

    primq,q,rq,ultq: puntero a nodo;
    ucod: n(6)

    cont_pedidos, cont2, cont1, cont55, cont_ganancias: entero;

    procedimiento borrar_nodo();
        /* Borramos antes del primero */
        si (rq = primq) entonces
            primq:= *primq.prox;
            *primq.ant:= NIL;
        sino
            /* Borramos el último */
            si (*rq.prox = NIL) entonces
                ult:= *rq.ant;
                *(*rq.ant).prox:= NIL;
            sino
                /* Borramos en el medio */
                *(*rq.ant).prox:= *rq.prox;
                *(*rq.prox).ant:= *rq.ant;
            fin_si
        fin_si
        disponer(rq);
    fin_procedimiento

proceso
    esc('¿Desea realizar la entrega de uno o varios pedidos? S/N');
    leer(op);

    si (op = 'S') entonces
        abrir e/(arch);
        leer(arch, reg);
        primq:= NIL;
        cont_pedidos:= 0;
        cont2:= 0;
        cont1:= 0;
        cont55:= 0;

        mientras NFDA(arch) hacer
            nuevo(q);
            *q.cod_p:= reg.cod_p;
            *q.dom_ent:= reg.dom_ent;
            *q.per:= reg.per;
            *q.costo:= reg.costo;
            *q.intentos:= 0;
            *q.prox:= NIL;

            ult:= q;

            si (primq = NIL) entonces
                primq:=q;
                *q.ant:= NIL;
            sino
                *q.ant:= rq;
                *(*q.ant).prox:= q;
            fin_si;
            rq:= q;

            leer(arch, reg);
        fin_mientras
        /* Ya tenemos la lista cargada con los pedidos */

        mientras (op = 'S') hacer
            cont55:= cont55 + 1;
            esc('Ingrese el código del pedido que desee entregar.');
            leer(ucod);

            rq:= primq;
            mientras ((*rq.prox <> NIL) y (ucod <> *q.cod_p)) hacer
                rq:= *rq.prox
            fin_mientras

            si (ucod = *q.cod_p) entonces
                esc('¿Ha podido realizar la entrega del pedido?');
                leer(op2);

                si (op2 = 'S') entonces
                    cont_ganancias:= cont_ganancias + *rq.costo;
                    borrar_nodo;
                    cont_pedidos:= cont_pedidos + 1;

                sino
                    *rq.intentos:= *rq.intentos + 1;
                    si (*rq.intento = 2) entonces
                        borrar_nodo;
                    fin_si

                fin_si

            sino
                esc('Error, no se ha encontrado el envío.');
            fin_si

            esc('¿Desea entregar realizar otra pedido?');
            leer(op);
        fin_mientras

        rq:= primq;
        mientras (*rq.prox <> NIL) hacer
            si (*rq.intentos = 1) entonces
                cont1:= cont1 + 1;
            fin_si
        fin_mientras

        esc('La cantidad total de envíos del día fue de: ', cont_pedidos);
        esc('La cantidad de pedidos que no se pudieron entregar: ', cont1 + cont2);
        esc('Los que se trataron de entregar 2 veces sin éxito representan un ', (cont2*100)/(cont1 + cont2),'% del total de no entregados.');
        esc('Las ganancias del día son: ', cont_ganancias - cont55*55)
    sino
        esc('Abortando el proceso... ');
    fin_si

fin_acción.
