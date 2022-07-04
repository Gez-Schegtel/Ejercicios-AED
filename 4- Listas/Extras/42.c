Ejercicio 4.2

Se dispone de una lista simplemente encadenada de números enteros, diseñar un algoritmo que a partir de ella genere otra lista conteniendo los nodos cuyos datos terminan en cero; dichos elementos, deberán ser eliminados de la lista original. Se asume que la lista está cargada, y que el algoritmo recibe como parámetro de entrada la dirección del primer elemento.


acción 42 (prim: puntero a NODO) es;
ambiente

    NODO = registro
        dato: n(2);
        prox: puntero a NODO;
    fin_registro

    p, ant, primq, q, antq: puntero a NODO;

proceso

    si (prim = NIL) entonces
        esc('Error! La lista está vacía.');
    sino

        p:= prim;
        primq:= NIL;

        mientras (p <> NIL) hacer

            si (*p.dato MOD 10 = 0) entonces
                nuevo(q); //cuando creo nuevo(q), estoy creando un nodo con una dirección adentro
                *q.dato:= *p.dato;
                *q.prox:= NIL;

                si (primq = NIL) entonces
                    primq:= q;
                sino
                    *antq.prox:= q;
                fin_si
                antq:= q;

                si (p = prim) entonces
                    p:= *p.prox;
                    disponer(prim);
                    prim:= p;
                sino
                    p:= *p.prox;
                    disponer(*ant.prox);
                    *ant.prox:= p;
                fin_si

            sino
                ant:= p;
                p:= *p.prox;
            fin_si

        fin_mientras

    fin_si

fin_acción.
