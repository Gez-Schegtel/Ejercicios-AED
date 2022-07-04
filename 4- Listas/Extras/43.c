
Dada una lista simplemente encadenada de números diseñar un algoritmo que calcule en forma independiente: La suma de los números impares, y la suma de los números pares


acción 43 (prim: puntero a NODO) es;
ambiente

    NODO = registro
        dato: n(2);
        prox: puntero a NODO;
    fin_registro

    p: puntero a NODO;

    suma_p, suma_i: entero;

proceso

    si (prim = NIL) entonces
        esc('Error! La lista está vacía.');
    sino
        p:= prim;
        suma_p:= 0;
        suma_i:= 0;

        mientras (p <> NIL) entonces

            si (*p.dato MOD 2 = 0) entonces
                suma_p:= suma_p + *p.dato;
            sino
                suma_i:= suma_i + *p.dato;
            fin_si

            p:= *p.prox;

        fin_mientras
    fin_si

    esc('El resultado de la suma de número pares es >> ', suma_p);
    esc('El resultado de la suma de número impares es >> ', suma_i);

fin_acción.
