
En el nuevo DELIVERY VAMOS-RAPIDO se está diseñando una solución informática para la atención de clientes. Se ha pensado en una LISTA por su dinamismo en cuanto a la cantidad de elementos. Diseñe un algoritmo que realice las siguientes funciones:

    Registrar su pedido en una lista Doble (se agrega en Estado P (Pendiente), y se mantiene ordenado por Nombre del Cliente).
    Realizar el envío (cambia estado del pedido de P (pendiente) a E (Enviado)).
    Eliminar del listado de atención una vez recibido el cobro (al atender el cobro del cadete que hizo el trabajo).
    Datos a almacenar por pedido: Nombre, Dirección, Teléfono y Total.

La información almacenada debe mantenerse ordenada por Nombre del cliente.


acción 412 ES;
ambiente
    NODO = registro
        nya: an(30);
        dir: an(30);
        tel: n(8);
        tot: n(5);
        est: ('P', 'E');
        prox: puntero a NODO;
        ant: puntero a NODO;
    fin_registro

    p, q, primq, ultq: puntero a NODO;
    op: ('S', 'N');
    op2: (1, 2, 3);
    user_nya: an(30);

    procedimiento registrar_pedido() ES;
        nuevo(q);
        esc('Ingrese su nombre: ');
        leer(*q.nya);
        esc('Ingrese su dirección: ');
        leer(*q.dir);
        esc('Ingrese su teléfono: ');
        leer(*q.tel);
        esc('Ingrese el monto total: ');
        leer(*q.total);
        *q.est:= 'P'

        si (primq = NIL) entonces
            /* Ingresamos el único nodo de la lista */
            primq:= q;
            ultq:= q;
            *q.prox:= NIL;
            *q.ant:= NIL;
        sino
            /* Acá recorremos para ver dónde lo insertamos */
            p:= primq;
            mientras ((*p.prox <> NIL) y (*q.nya > *p.nya)) hacer
                p:= *p.prox;
            fin_mientras

            si (primq = ultq) entonces
                /* Esto es para listas que tienen un solo nodo */
                si (*q.nya < *p.nya) entonces
                    /* Insertamos antes del único elemento */
                    *q.prox:= primq;
                    *primq.ant:= q;
                    *q.ant:= NIL;
                    primq:= q;
                sino
                    /* Insertamos después del único elemento */
                    *q.prox:= NIL;
                    *q.ant:= p;
                    *p.prox:= q;
                    ultq:= q;
                fin_si
            sino
                /* Acá entra si la lista tiene más de un nodo */
                si (p = primq) entonces
                    /* Tenemos que insertar antes del primer elemento */
                    *q.prox:= primq;
                    *primq.ant:= q;
                    *q.ant:= NIL;
                    primq:= q;
                sino
                    si (*p.prox = NIL) entonces
                        /* Insertamos el último elemento */
                        *q.prox:= NIL;
                        *q.ant:= p;
                        *p.prox:= q;
                        ultq:= q;
                    sino
                        /* Insertamos en el medio */
                        *(*p.prox).ant:= q;
                        *q.prox:= *p.prox;
                        *q.ant:= p;
                        *p.prox:= q;
                    fin_si
                fin_si
            fin_si

        fin_si
    fin_procedimiento

    procedimiento realizar_envio() ES;
        si (primq = NIL) entonces
            esc('Error!, la lista está vacía.');
        sino
            esc('Ingrese el nombre del cliente a realizar el envío: ');
            leer(user_nya);

            p:= primq;
            mientras ((*p.prox <> NIL) y (user_nya <> *p.nya)) hacer
                p:= *p.prox;
            fin_mientras

            si (user_nya = *p.nya) entonces
                esc('Éxito!, se ha cambiado el estado del cliente a ENVIADO');
                *p.est:= 'E';
            sino
                esc('Error!, no se ha encontrado al cliente solicitado.');
            fin_si
        fin_si
    fin_procedimiento

    procedimiento eliminar_cliente() ES;
        si (primq = NIL) entonces
            esc('Error!, la lista está vacía.');
        sino
            esc('Ingrese el nombre del cliente a realizar el envío: ');
            leer(user_nya);

            p:= primq;
            mientras ((*p.prox <> NIL) y (user_nya <> *p.nya)) hacer
                p:= *p.prox;
            fin_mientras

            si (user_nya = *p.nya) entonces
                si (primq = ultq) entonces
                    /* Esto es para cuando hay un solo elemento en la lista */
                    primq:= NIL;
                    ultq:= NIL;
                sino
                    si (p = primq) entonces
                        /* Eliminamos antes del primer elemento */
                        *(*p.prox).ant:= NIL;
                        primq:= *p.prox;
                    sino
                        si (*p.prox = NIL) entonces
                            /* Eliminamos el último nodo de la lista */
                            *(*p.ant).prox:= NIL;
                            ultq:= *p.ant;
                        sino
                            /* Eliminamos un nodo del medio */
                            *(*p.prox).ant:= *p.ant;
                            *(*p.ant).prox:= *p.prox;
                        fin_si
                    fin_si
                fin_si
                disponer(p);
            sino
                esc('Error!, no se ha encontrado al cliente solicitado.');
            fin_si

        fin_si
    fin_procedimiento

proceso
    esc('¿Desea realizar una operación? S/N');
    leer(op);

    primq:= NIL;

    mientras (op = 'S') hacer

        esc('Seleccione una opción: ');
        esc('1- Registrar pedido.');
        esc('2- Realizar envío.');
        esc('3- Eliminar cliente de la lista de espera.');
        leer(op2);

        según (op2) hacer
            1: registrar_pedido();
            2: realizar_envio();
            3: eliminar_cliente();
        fin_según

        esc('¿Desea realizar otra operación? S/N');
        leer(op);
    fin_mientras

fin_acción.
