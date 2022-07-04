

Dada una lista doblemente encadenada de enteros, ordenada en forma creciente, escriba un algoritmo que elimine las entradas repetidas. El algoritmo debe verificar al inicio que la lista que se pasa como argumento está ordenada; en caso afirmativo realizar la depuración y emitir un mensaje de 'ÉXITO'; en caso contrario, emitir un mensaje de 'ERROR'.

accion 413 (prim, ult: puntero a NODO) ES;
ambiente

    NODO = registro
        dato: entero;
        prox: puntero a NODO;
        ant: puntero a NODO;
    fin_registro

proceso

    si (prim = NIL) entonces
        esc('Error!, La lista está vacía.');
    sino
        p:= prim
        mientras ((*p.dato < *(*p.prox).dato) y (*p.prox <>  NIL)) hacer
            p:=*p.prox;
        fin_mientras

        /* Si entra acá es porque la lista está desordenada */
        si ((*p.dato > *(*p.prox).dato) y (*p.prox <> NIL)) entonces
            esc('Error!, la lista está desordenada.');
        sino
            /* Acá entra si está ordenada */
            p:= prim;
            /* Este ciclo es para la depuración */
            mientras (*p.prox <> NIL) hacer

                si (*p.dato = *(*p.prox).dato) entonces

                    si (p = prim) entonces
                        /* Eliminamos el primer elemento */
                        prim:= *p.prox;
                        *prim.ant:= NIL;
                        p:= *p.prox; /* Esto hacemos para no perder p, y así seguir recorriendo */
                        disponer(*p.ant);
                    sino
                        si (*p.prox = NIL) entonces
                            /* Eliminamos el último nodo */
                            ult:= *p.ant;
                            p:= ult;
                            disponer(*p.prox);
                            *ult.prox:= NIL;
                        sino
                            /* Eliminamos un nodo del medio */
                            *(*p.prox).ant:= *p.ant;
                            *(*p.ant).prox := *p.prox;
                            p:= *p.prox; /* Ídem línea 39 */
                            disponer(*p.ant);
                        fin_si
                    fin_si

                sino
                    /* acá entra porque no borra nada, no se cumple la condición del condicional */
                    p:= *p.prox;

                fin_si
            fin_mientras

            esc('Éxito!, la lista está ordenada y se realizó correctamente la depuración.');
        fin_si
    fin_si

fin_acción
