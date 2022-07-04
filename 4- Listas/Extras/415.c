

Supóngase que, utilizando una lista encadenada, se implementa una cola Q (estructura 'FIFO', es decir, 'primero en entrar, primero en salir'). Diseñar un algoritmo que permita insertar o extraer un elemento, comprobando siempre si la cola está vacía o no.


acción 415 ES;
ambiente
    NODO = registro
        dato: n(4);
        prox: puntero a NODO;
    fin_registro

    p, q, primq, ant: puntero a NODO;
    op: ('S', 'N');
    user_data: n(4);

proceso
    primq:= NIL;

    esc('¿Desea ingresar un número? S/N');
    leer(op);

    si (op = 'S') entonces
        mientras (op = 'S') hacer

            nuevo(q);
            esc('Ingrese un número >> ');
            leer(*q.dato);
            *q.prox:= NIL;

            si (primq = NIL) entonces
                primq:= q;
            sino
                *ant.prox:= q;
            fin_si
            ant:= q;

            esc('¿Desea ingresar otro número? S/N');
            leer(op);

        fin_mientras

        esc('¿Desea iniciar el borrado de elementos? S/N');
        leer(op);

        si (op = 'S') entonces

            mientras ((op = 'S') y (primq <> NIL)) hacer
                /* Verifcamos (primq <> NIL) para detener el proceso si el usuario borra toda la lista */

                esc('Ingrese el número que desee extraer >> ');
                leer(user_data);

                p:= primq;
                mientras ((*p.prox <> NIL) y (user_data <> *p.dato)) hacer
                    ant:= p;
                    p:= *p.prox;
                fin_mientras

                si (user_data = *p.dato) entonces
                    si (p = primq) entonces
                        primq:= *p.prox;
                    sino
                        *ant.prox:= *p.prox;
                    fin_si
                    disponer(p);
                    esc('Se ha eliminado con éxito el elemento >> ', user_data);

                sino
                    esc('Error!, no se ha encontrado el elemento solicitado.');
                fin_si

                esc('¿Desea eliminar otro elemento? S/N');
                leer(op);
            fin_mientras

        sino
            esc('Saliendo... No se han borrado elementos.');
        fin_si
    sino
        esc('Abortando ejecución...');
    fin_si

fin_acción.
