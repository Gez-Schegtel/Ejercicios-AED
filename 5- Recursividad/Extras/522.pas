
{
    Leer una palabra (una cadena de caracteres) y la cantidad de caracteres y generar su palíndromo. El palíndromo de “Venezuela” es “aleuzeneV”.

    caso base: *p.prox = NIL ; esc(*p.dato)
    caso recursivo: *p.prox <> NIL ; inverso(*p.prox)
}

acción 522 (prim: puntero a NODO) ES;
ambiente
    NODO = registro
        dato: caracter;
        prox: puntero a NODO;
    fin_registro

    p: puntero a NODO;

    procedimiento inverso(p:puntero a NODO) ES;

        si (*p.prox <> NIL) entonces
            inverso(*p.prox);
        fin_si
        esc(*p.dato);

    fin_procedimiento

proceso

    esc('Este algoritmo escribirá la siguiente palabra al revés... ');
    p:= prim
    mientras (p <> NIL) hacer
        esc(*p.dato);
        p:= *p.prox;
    fin_mientras

    p:=prim;
    inverso(p);
fin_acción.
