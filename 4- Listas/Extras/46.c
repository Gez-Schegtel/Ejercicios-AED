

En el restaurante ÑOQUIS se está pensando en una solución informática para el soporte de datos del nuevo sistema de atención a clientes. Se han decidido por LISTAS por su dinamismo en cuanto a la cantidad de elementos. Diseñe un algoritmo que realice las siguientes funciones:

    Añadir cliente al ser atendido (lista simple ordenada por Nombre del Cliente).
    Registrar su consumo (Acumular el Total Consumido en valores de montos).
    Realizar el cobro (emitir ticket con Nombre, Fecha, Número de Mesa y Total).
    Eliminar del listado de atención.

La información almacenada debe mantenerse ordenada por Nombre del cliente.


acción 46 ES;
ambiente
    fecha = registro
        aaaa: n(4);
        mm: (1..12);
        dd: (1..31);
    fin_registro

    cliente = registro
        nombre: an(30);
        consumo: n(4);
        fecha_c: fecha;
        nro_mesa: n(2);
        prox: puntero a cliente;
    fin_registro
    
    p, prim, ant, c: puntero a cliente;

    op1: (1..4);
    op2: ('S', 'N');

    user_nombre: an(30);
    user_consumo: n(4);

    procedimiento agregar_cliente() ES;
        nuevo(c);
        esc('Nombre del cliente: ');
        leer(*c.nombre);
        *c.consumo:= 0;
        *c.fecha_c:= system_date();
        esc('Nro. de mesa: ');
        leer(*c.nro_mesa);

        si (prim = NIL) entonces
        /* Es el primer nodo que se crea */
            prim:= c;
            *c.prox:= NIL;
        sino
            /* Ya existen nodos en la lista */
            /* Se "inicializa" p con prim para empezar el recorrido */
            p:= prim;

            /* La lista se cargará ordenada de manera ascendente por nombre de cliente */
            mientras ((p <> NIL) y (*c.nombre > *p.nombre)) hacer
                ant:= p;
                p:= *p.prox;
            fin_mientras

            si (p = prim) entonces
                /* Agregamos antes del primer nodo de la lista */
                *c.prox:= prim;
                prim:= c;
            sino
                /* Agregamos un nodo al principio o al final de la lista */
                *ant.prox:= c;
                *c.prox:= p;
            fin_si

        fin_si

    fin_procedimiento.

    procedimiento registrar_consumo() ES;
        esc('Ingrese el nombre del cliente con el que desee operar.');
        leer(user_nombre);

        p:= prim;

        mientras ((p <> NIL) y (user_nombre <> *p.nombre)) hacer
            p:= *p.prox;
        fin_mientras

        si (user_nombre = *p.nombre) entonces
            repetir
                esc('Ingrese el consumo que desee registrar: ');
                leer(user_consumo);
                *p.consumo:= *p.consumo + user_consumo;

                esc('¿Desea realizar registrar otro valor? s/n');
                leer(op2);
            hasta_que(op2 = 'N');
        sino
            esc('Error!, no se ha encontrado al cliente solicitado o la lista está vacía.');
        fin_si

    fin_procedimiento

    procedimiento emitir_ticket() ES;
        esc('Ingrese el nombre del cliente con el que desee operar.');
        leer(user_nombre);

        p:= prim;

        mientras ((p <> NIL) y (user_nombre <> *p.nombre)) hacer
            p:= *p.prox;
        fin_mientras

        si (user_nombre = *p.nombre) entonces
            esc('Nombre >> ', *p.nombre);
            esc('Nro. de mesa >> ', *p.nro_mesa);
            esc('Fecha (dd/mm/aaaa) >> ', *p.fecha_c.dd, '/', *p.fecha_c.mm, '/',*p.fecha_c.aaaa);
            esc('Monto >> ', *p.consumo);
        sino
            esc('Error!, no se ha encontrado al cliente solicitado o la lista se encuentra vacía.');
        fin_si

    fin_procedimiento

    procedimiento eliminar_cliente() ES;
        esc('Ingrese el nombre del cliente con el que desee operar.');
        leer(user_nombre);

        p:= prim;

        mientras ((p <> NIL) y (user_nombre <> *p.nombre)) hacer
            ant:= p;
            p:= *p.prox;
        fin_mientras

        /* Primero verificamos si se encontró al cliente */
        si (user_nombre = *p.nombre) entonces
            /* Luego, si se encontró, verificamos en qué posición está */
            si (p = prim) entonces
                prim:= *p.prox;
            sino
                *ant.prox:= *p.prox;
            fin_si

            disponer(p);
            esc('¡Cliente exitosamente eliminado!');
        sino
            esc('Error!, no se ha encontrado al cliente solicitado o la lista se encuentra vacía.');
        fin_si

    fin_procedimiento

proceso

    prim:= NIL;

    repetir

        esc('Ingrese la opción que desee realizar: ');
        esc('1- Agregar cliente.');
        esc('2- Registrar consumo.');
        esc('3- Emitir ticket.');
        esc('4- Eliminar cliente.');
        leer(op1);

        según (op1) hacer
            1: agregar_cliente();
            2: registrar_consumo();
            3: emitir_ticket();
            4: eliminar_cliente();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);

    hasta_que(op2 = 'N');

fin_acción.
