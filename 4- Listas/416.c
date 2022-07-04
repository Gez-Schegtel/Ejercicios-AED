
acción 416 (primq: puntero a nodo) es;
ambiente
    nodo = registro
        dato: entero;
        prox: puntero a nodo;
    fin_registro

    q: puntero a nodo;
    op1: (1, 2);
    op2: ('s', 'n');
    udato: entero;

    procedimiento insertar es;
        nuevo(q);
        *q.prox:= primq;
        primq:= q;
        esc('Ingrese el número que desee cargar a la lista: ');
        leer(*q.dato);
    fin_procedimiento

    procedimiento eliminar es;
        si (primq <> NIL) entonces
            esc('Ingrese el número que desee eliminar.');
            leer(udato);

            rq:= NIL;
            q:= primq;
            mientras (q <> NIL) y (*q.dato <> udato) hacer
                rq:= q;
                q:= *q.prox;
            fin_mientras

            si (q <> NIL) entonces
                si (rq = NIL) entonces
                    primq:= *primq.prox;
                sino
                    *rq.prox:= *q.prox;
                fin_si
                disponer(q);
                esc('Elemento exitosamente eliminado.');
            sino
                esc('Error, no se ha encontrado el elemento.');
            fin_si
        sino
            esc('Error, la lista está vacía.');
        fin_si
    fin_procedimiento

proceso
    repetir
        esc('Seleccione una opción: ');
        esc('1- Insertar.');
        esc('2- Eliminar.');
        leer(op1);

        según (op1) hacer
            1: insertar();
            2: eliminar();
        fin_según

        esc('¿Desea realizar otra operación? s/n');
        leer(op2);
    hasta_que (op2 = 'n');
fin_acción.
