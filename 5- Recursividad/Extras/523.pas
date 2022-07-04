
/*
Dada una lista de nombres ordenada en forma ascendente, construir un procedimiento recursivo que imprima como salida la misma lista, pero en orden descendente, sin modificar la lista original.

Orden ascendente: 'Agustín' 'Benjamín' 'Claudio' 'Dario' 'Juani'
Orden descendente: 'Juani' 'Dario' 'Claudio' 'Benjamín' 'Agustín'

Caso base: *p.prox = NIL ; esc(*p.dato)

Caso recursivo: *p.prox <> NIL ; orden_ascendente(*p.prox);
*/

acción 523 (prim: puntero a NODO) ES;
ambiente
    NODO = registro
        dato: an(40);
        prox: puntero a NODO;
    fin_registro

    p: puntero a NODO;

    procedimiento orden_descendente(p: puntero a nodo) ES;
        si (*p.prox <> NIL) entonces
            orden_descendente(*p.prox);
        fin_si
        esc(*p.dato);
    fin_procedimiento

proceso
    esc('Nombres en orden ascendente: ');
    p:= prim;
    Mientras (p <> NIL) hacer
        esc(*p.dato);
        p:= *p.prox;
    fin_mientras

    esc('Nombres escritos en forma descendente: ');
    p:=prim;
    orden_descendente(p);

fin_acción.
