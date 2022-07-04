

acción c47 (primA, primNA: puntero a nodo) es;
ambiente
    nodo = registro
        pat: an(10); // Patente del auto
        cli: entero; // Clientes que tuvo
        prox: puntero a nodo;
    fin_registro

    rA, rNA: puntero a nodo;
    op: ('s', 'n');
    cont: entero;

    procedimiento recorrido es;
        rA:= primA;
        mientras (*rA.prox <> NIL) hacer
            rA:= *rA.prox;
        fin_mientras
    fin_procedimiento

    /* Opción 1.
    procedimiento asignar es;
        si (primNA <> NIL) entonces
            *primNA.cli:= *primNA.cli + 1;

            si (primA <> NIL) entonces
                recorrido();
                *rA.prox:= primNA;
                primNA:= *primNA.prox;
                *(*rA.prox).prox:= NIL;
            sino
                primA:= primNA;
                primNA:= *primNA.prox;
                *primA.prox:= NIL;
            fin_si
        sino
            *primA.cli:= *primA.cli + 1;
            recorrido();
            *rA.prox:= primA;
            primA:= *primA.prox;
            *(*rA.prox).prox:= NIL;
        fin_si
    fin_procedimiento
    */

    /* Opción 2. Me parece la mejor. */
    procedimiento asignar es;
        si (primNA <> NIL) entonces
            rNA:= primNA;
            primNA:= *primNA.prox;
            *rNA.prox:= NIL;
            *rNA.cli:= *rNA.cli + 1;

            si (primA <> NIL) entonces
                recorrido();
                *rA.prox:= rNA;
            sino
                primA:= rNA;
            fin_si
        sino
            rNA:= primA;
            *primA:= *primA.prox;
            *rNA.prox:= NIL;
            *rNA.cli:= *rNA.cli + 1;

            recorrido();
            *rA.prox:= rNA;
        fin_si
    fin_procedimiento

proceso
    cont:= 0;
    repetir
        cont:= cont + 1;
        asignar();
        esc('¿Desea asignar otro móvil? s/n');
        leer(op);
    hasta_que (op = 'n');

    esc('Número de clientes en el día: ', cont);
fin_acción.
