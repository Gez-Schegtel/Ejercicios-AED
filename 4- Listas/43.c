

acción 43 (prim: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    p: puntero a nodo;
    p, i: entero;

proceso
    si (prim = NIL) entonces
        esc('Error, la lista de entrada está vacía!');
    sino
        p:= 0;
        i:= 0;
        p:= prim;
        mientras (p <> NIL) hacer
            si (*p.dato mod 2 = 0) entonces
                p:= p + *p.dato;
            sino
                i:= i + *p.dato;
            fin_si

            p:= *p.prox;
        fin_mientras

        esc('Sumatoria de números pares >> ', p);
        esc('Sumatoria de números impares >> ', i);
    fin_si
fin_acción.
