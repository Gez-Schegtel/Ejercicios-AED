

Supóngase que, utilizando una lista encadenada, se implementa una pila P (estructura 'LIFO', es decir, 'último en entrar, primero en salir'). Diseñar un algoritmo que permita insertar o extraer un elemento, comprobando siempre si la pila está vacía o no.

acción 416 ES;
ambiente
    NODO = registro
        dato: N(5);
        prox: puntero a NODO;
    fin_registro

    p, q,primq,ant: puntero a NODO;
    op: ('S','N');
    numb: N(5)
proceso

    esc('¿Desea insertar un dato? S/N');
    leer(op);

    si (op = 'S') entonces
        primq:= NIL

        Mientras (op = 'S') hacer
            nuevo(q);
            esc('Ingrese el número');
            leer(*q.dato);

            *q.prox:= primq;
            primq:= q;

            esc('¿Desea insertar otro dato? S/N');
            leer(op);
        fin_mientras

        esc('¿Desea eliminar algún dato? S/N');
        leer(op);

        si (op = 'S') entonces
            Mientras ((op = 'S') y (primq <> NIL)) hacer
                esc('Inserte el dato a borrar.');
                leer(numb);

                p:= primq; /* inicio el recorrido */
                mientras ((*p.prox <> NIL) y (numb <> *p.dato)) hacer
                    ant:= p
                    p:=*p.prox
                fin_mientras

                /* Analizamos si se encontró el dato */
                si (numb = *p.dato) entonces
                    /* Luego analizamos dónde se encontró */
                    si (p = primq) entonces
                        primq:= *p.prox;
                    sino
                        *ant.prox:= *p.prox
                    fin_si
                    disponer(p);
                sino
                    esc('No se encontró el elemento a borrar.');
                fin_si
                esc('¿Desea borrar otro dato? S/N');
                leer(op);
            fin_mientras
        sino
            esc('Cerrando el programa. No se han eliminado elementos.');
        fin_si
    sino
        esc('Cerrando el programa. No se han cargado elementos.');
    fin_si

fin_acción
