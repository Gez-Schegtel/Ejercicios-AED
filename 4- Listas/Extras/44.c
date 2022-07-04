
Se dispone de una lista simplemente encadenada cuyos registros están ordenados en forma ascendente por una clave de tipo entero; diseñar un algoritmo que invierta el orden de la lista.

// 12345 a 54321 //

acción 44 (prim: puntero a NODO) es;
ambiente

    NODO = registro 
        dato: entero;
        prox: puntero a NODO;
    fin_registro 

    p, q, primq: puntero a NODO;    
    
proceso

    si (prim = NIL) entonces 
      esc('La lista está vacía.');
    sino 
        p:= prim;
        primq:= NIL;

        mientras (p <> NIL) hacer

            nuevo(q);
            *q.dato:= *p.dato;
            *q.prox:= primq;
            primq:= q; 

            p:= *p.prox;

        fin_mientras 
      
        mientras (q <> NIL) hacer
          esc (*q.dato)
          q:= *q.prox
        fin_mientras

    fin_si

fin_acción.


/****************

>> Algoritmo de carga apilada (LIFO) <<

LEER (valor)

Prim:= nil
MIENTRAS (valor <> '*') HACER
    NUEVO (p)
    *p.Dato:= valor
    *p.Prox:= Prim
    Prim:= p
    LEER(valor)
FIN MIENTRAS

****************/