

Diseñar un algoritmo para acceder, eliminar o insertar el k-ésimo elemento de una lista (siendo k una posición dada). Si la lista está vacía o si el valor de k esta fuera del rango del índice de la lista, invocar al procedimiento de ERROR. En cualquier otro caso, efectuar el procedimiento solicitado.

Acción 41 (prim: puntero a NODO) ES;
Ambiente
    NODO = registro
        dato: n(2);
        prox: puntero a NODO;
    fin_registro

    op: (1..3);

    k: entero;
    cont_pos: entero;
    p: puntero a NODO;
    ant: puntero a NODO;
    dat: n(2);
    q: puntero a NODO;

    procedimiento acceder ES;
        si (p = NIL) entonces
            esc('La lista está vacía.');
        sino
            mientras (*p.prox <> NIL) y (k <> cont_pos) hacer
                cont_pos:= cont_pos + 1;
                p:= *p.prox;
            fin_mientras

            si (k = cont_pos) entonces
                esc('La lista en la dirección', p, 'tiene el dato', *p.dato);
            sino
                esc('No se encontró la posición. La lista tiene menos elementos.');
            fin_si
        fin_si
    fin_procedimiento

    procedimiento eliminar ES;
        si (p = NIL) entonces
            esc('La lista está vacía.');
        sino
            mientras (*p.prox <> NIL) y (k <> cont_pos) hacer
                cont_pos:= cont_pos + 1;
                ant:= p;
                p:= *p.prox
            fin_mientras

            si (k = 1) entonces
                prim:= *p.prox;
                disponer(p);
            sino
                si (k = cont_pos) entonces
                    *ant.prox:= *p.prox;
                    disponer(p);
                sino
                    esc('No se encontró la posición', k, 'La lista tiene menos elementos');
                fin_si
            fin_si
        fin_si


    fin_procedimiento

    procedimiento insertar ES;
        si (p = NIL) y (k = 1) entonces
            esc('Ingrese el dato a insertar');
            leer(dat);
            nuevo(q);
            prim:= q;
            *q.prox:= NIL;
            *q.dato:= dat;
        sino
            si (p = NIL) entonces
                esc('La lista está vacía y no concuerda la posición solicitada. Abortando...');
            sino
                mientras (*p.prox <> NIL) y (k <> cont_pos) hacer
                    cont_pos:= cont_pos + 1;
                    ant:= p;
                    p:= *p.prox;
                fin_mientras

                si (k = 1) entonces
                    esc('Ingrese el dato a insertar');
                    leer(dat);
                    nuevo(q);
                    prim:= q;
                    *q.prox:= p;
                    *q.dato:= dat;
                sino
                    si (k = cont_pos) entonces
                        esc('Ingrese el dato a insertar');
                        leer(dat);
                        nuevo(q);
                        *ant.prox:= q;
                        *q.prox:= p;
                        *q.dato:= dat;
                    sino
                        esc('El número de NODO no es correcto.');
                    fin_si
                fin_si
            fin_si
        fin_si
    fin_procedimiento

Proceso
    esc('Ingrese una opción');
    esc('Acceder >> 1');
    esc('Eliminar >> 2');
    esc('Insertar >> 3');
    leer(op);

    esc('Ingrese la posición del NODO con el que desee hacer la operación.');
    leer(k);

    p:= prim;
    cont_pos:= 1;

    si (op = 1) entonces
        acceder;
    sino
        si (op = 2) entonces
            eliminar;
        sino
            insertar;
        fin_si
    fin_si

Fin_Acción.
