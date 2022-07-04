

acción 46 es;
ambiente
    fecha = registro
        aaaa: n(4);
        mm: (1..12);
        dd: (1..31);
    fin_registro

    nodo = registro
        nombre: an(30);
        fecha_c: fecha;
        nro_mesa: entero;
        consumo: real;
        prox: puntero a nodo;
    fin_registro

    q, primq, r, rr: puntero a nodo;

    op1: (1..4);
    op2: ('s', 'n');
    u_nombre: an(30);
    u_consumo: real;


    /* Se cargan solamente los datos a un nodo. */
    procedimiento nuevo_nodo es;
        nuevo(q);
        esc('Nombre del cliente >> ');
        leer(*q.nombre);
        *q.fecha_c:= system_date;
        esc('Número de mesa >> ');
        leer(*q.nro_mesa);
        esc('Total consumido >> ');
        leer(*q.consumo);
    fin_procedimiento


    /* Se enlaza ordenadamente el nodo creado a la lista. */
    procedimiento cargar_cliente es;
        nuevo_nodo();

        rr:= NIL;
        r:= primq;
        mientras (r <> NIL) y (*r.nombre < *q.nombre) hacer
            rr:= r;
            r:= *r.prox;
        fin_mientras

        si (rr = NIL) entonces
            *q.prox:= primq;
            primq:= q;
        sino
            *rr.prox:= q;
            *q.prox:= r;
        fin_si
    fin_procedimiento


    /* Realiza la búsqueda de un nodo según el nombre del cliente que almacena. */
    procedimiento buscar_cliente es;
        esc('Ingrese el nombre del cliente... ');
        leer(u_nombre);

        rr:= NIL;
        r:= primq;
        mientras (r <> NIL) y (*r.nombre <> u_nombre) hacer
            rr:= r; /* Este resguardo sólo lo necesito para la eliminación. */
            r:= *r.prox;
        fin_mientras
    fin_procedimiento


    /* Suma valores de consumo a un cliente previamente cargado. */
    procedimiento registrar_consumo es;
        buscar_cliente();

        si (r <> NIL) entonces
            esc('Ingrese el monto que desee sumar a este cliente.');
            leer(u_consumo);
            *r.consumo:= *r.consumo + u_consumo;
        sino
            esc('Error, no se ha encontrado el cliente en la lista.');
        fin_si
    fin_procedimiento


    /* Se emite la información del nodo. */
    procedimiento realizar_cobro es;
        buscar_cliente();

        si (r <> NIL) entonces
            esc('Nombre | Fecha | Nro. de Mesa | Total');
            esc(*r.nombre);
            esc(*r.fecha_c.aaaa);
            esc(*r.fecha_c.mm);
            esc(*r.fecha_c.dd);
            esc(*r.nro_mesa);
            esc(*r.consumo);
        sino
            esc('Error, no se ha encontrado el cliente en la lista.');
        fin_si
    fin_procedimiento


    /* Se elimina un nodo de la lista. */
    procedimiento eliminar_cliente es;
        buscar_cliente();

        si (r <> NIL) entonces
            si (rr = NIL) entonces
                primq:= *primq.prox;
            sino
                *rr.prox:= *r.prox;
            fin_si
            disponer(r);
        sino
            esc('Error, no se ha encontrado la clave solicitada.');
        fin_si
    fin_procedimiento


proceso
    primq:= NIL;
    repetir
        esc('Seleccione ona opción... ');
        esc('1- Añadir cliente.');
        esc('2- Registrar consumo.');
        esc('3- Realizar cobro.');
        esc('4- Eliminar cliente del listado de atención.');
        leer(op1);

        según (op1) hacer
            1: cargar_cliente();
            2: registrar_consumo();
            3: realizar_cobro();
            4: eliminar_cliente();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.
