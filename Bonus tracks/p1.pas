

Dada una lista simplemente encadenada de números enteros, diseñar un algoritmo que a partir de ella genere otra lista conteniendo los nodos cuyos datos sean múltiplos de 3, dichos elementos deberán ser eliminados de la lista original. Se asume que la lista está cargada y que el algoritmo recibe como parámetro de entrada la dirección del primer elemento.

acción 4.2c (prim: puntero a NODO) ES;
ambiente
    NODO = registro
        dato: N(3)
        prox: puntero a NODO;
    fin_registro

    p,q,primq,ant,antq: puntero a NODO;

proceso

    si (prim = NIL) entonces
        esc('La lista está vacía.');
    sino
        p:= prim;
        primq:= NIL;
        mientras (p <> NIL) hacer
            si (*p.dato MOD 3 = 0) entonces
                nuevo(q);
                *q.prox:= NIL;
                *q.dato:= *p.dato;

                si (primq = NIL) entonces
                    primq:= q;
                    antq:= q;
                sino
                    *antq.prox:= q;
                    antq:= q;
                fin_si

                si (p = prim) entonces
                    p:= *prim.prox;
                    disponer(prim);
                    prim:= p;
                sino
                    p:= *p.prox;
                    disponer(*ant.prox);
                    *ant.prox:=p;
                fin_si

            sino
                ant:= p;
                p:=*p.prox;
            fin_si
        fin_mientras
    fin_si

fin_acción
