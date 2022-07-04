

Escribir un algoritmo que permita buscar, insertar o borrar un elemento identificado con una clave determinada en una lista circular simplemente encadenada.

/* Hago primero para listas simplemente enlazadas para practicar */

acción 48 (prim: puntero a NODO) ES;
ambiente

    NODO = registro
        dato: n(2);
        prox: puntero a NODO;
    fin_registro

    p, ant, q: puntero a NODO;
    user_data: n(2);
    op1: (1..3);
    op2: ('S', 'N');

    procedimiento buscar() ES;

        p:= prim;

        mientras ((p <> NIL) y (user_data <> *p.dato)) hacer
            p:= *p.prox;
        fin_mientras

        si (user_data = *p.dato) entonces
            esc('Se ha encontrado en la lista el dato proporcionado por el usuario.');
            esc('El dato es >> ', *p.dato)
        sino
            esc('No se ha encontrado el dato proporcionado por el usuario o la lista está vacía.');
        fin_si


    fin_procedimiento

    procedimiento insertar() ES;

        nuevo(q);
        *q.dato:= *p.dato;

        si (prim = NIL) entonces
            /* Va a ser el primer elemento en toda la lista */
            prim:= q;
            *q.prox:= NIL;
        sino

            /* "Inicializamos" >>p<< para empezar a ver dónde insertamos */
            p:= prim;

            mientras ((p <> NIL) y (*q.dato > *p.dato)) hacer
                ant:= p;
                p:= *p.prox;
            fin_mientras

            si (p = prim) entonces
                /* Insertamos antes del primer elemento */
                *q.prox:= prim;
                prim:= q;
            sino
                /* Insertamos en el medio o al final */
                *ant.prox:= q;
                *q.prox:= p;
            fin_si

        fin_si

    fin_procedimiento

    procedimiento eliminar() ES;

        p:= prim;

        mientras ((p <> NIL) y (user_data <> *p.dato)) hacer
            ant:= p;
            p:= *p.prox;
        fin_mientras

        si (user_data = *p.dato) entonces

            si (p = prim) entonces
                /* Elimino el primer elemento de la lista */
                prim:= *p.prox;
            sino
                /* Elimino un elemento del medio o el último elemento de la lista */
                *ant.prox:= *p.prox;
            fin_si

            disponer(p);

            esc('Se ha eliminado de la lista el dato proporcionado por el usuario.');

        sino
            esc('No se ha encontrado el dato proporcionado por el usuario o la lista está vacía.');
        fin_si

    fin_procedimiento

proceso

    repetir

        esc('Ingrese el valor con el que desee operar: ');
        leer(user_data);

        esc('Seleccione el proceso que desee realizar con dicho valor: ');
        esc('1- Buscar.');
        esc('2- Insertar.');
        esc('3- Borrar');
        leer(op1);

        según (op1) hacer
            1: buscar();
            2: insertar();
            3: borrar();
        fin_según

        esc('¿Desea realizar otra operación?');
        leer(op2);

    hasta_que(op2 = 'N');

fin_acción.


/* Listas circulares simples */

acción 48 (prim: puntero a NODO) ES;
ambiente

    NODO = registro
        dato: n(2);
        prox: puntero a NODO;
    fin_registro

    p, ant, q, ult: puntero a NODO;
    user_data: n(2);
    op1: (1..3);
    op2: ('S', 'N');
    op3:n(2)

    procedimiento buscar () ES;

        si (prim <> NIL) entonces
            p:= prim;
            mientras ((*p.prox <> prim) y (user_data <> *p.dato)) hacer
                p:= *p.prox;
            fin_mientras

            si (user_data = *p.dato) entonces
                esc('Se ha encontrado el dato proporcionado por el usuario.');
                esc('El dato es >> ', user_data);
            sino
                esc('Error!, no se ha encontrado el dato proporcionado por el usuario.');
            fin_si

        sino
            esc('Error!, la lista está vacía.');
        fin_si

    fin_procedimiento


    procedimiento insertar () ES;

        /* Hacemos no ordenado */
        nuevo(q);
        *q.dato:= user_data;

        si (prim = NIL) entonces
            prim:= q;
            *q.prox:= prim; /* porque es circular, entonces tiene que apuntarse a sí mismo */
        sino
            *q.prox:= *prim.prox;
            *prim.prox:= q;
        fin_si

    fin_procedimiento

    procedimiento borrar() ES;

        si (prim = NIL) entonces
            esc('Error!, la lista está vacía.');
        sino
            p:= prim;
            mientras ((*p.prox <> prim) y (*p.dato <> user_data)) hacer
                ant:= p;
                p:= *p.prox;
            fin_mientras

            si (*p.dato <> user_data) entonces
                esc('Error!, no se encontró el elemento.');
            sino
                si (*p.prox = prim) entonces
                    /* Borramos el único elemento */
                    prim:= NIL;
                sino
                    si (p = prim) entonces
                        /* Borramos el primer elemento */
                        /* Recorremos para obtener la pos. del último elemento */
                        ult:= prim;
                        mientras (*ult.prox <> prim) hacer
                            ult:= *ult.prox;
                        fin_mientras

                        *ult.prox:= *prim.prox;
                        prim:= *prim.prox;

                    sino
                        /* Eliminamos en el medio o al final */
                        *ant.prox:= *p.prox;
                    fin_si
                fin_si

                disponer(p);
            fin_si
        fin_si

    fin_procedimiento


proceso

    repetir

        esc('Ingrese el valor con el que desee operar: ');
        leer(user_data);

        esc('Seleccione el proceso que desee realizar con dicho valor: ');
        esc('1- Buscar.');
        esc('2- Insertar.');
        esc('3- Borrar');
        leer(op1);

        según (op1) hacer
            1: buscar();
            2: insertar();
            3: borrar();
        fin_según

        esc('¿Desea realizar otra operación?');
        leer(op2);

    hasta_que(op2 = 'N');

fin_acción.
