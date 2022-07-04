

acción 49 (prim: puntero a encriptar) es;
ambiente
    arr: arreglo de [1..255] de caracter;
    i, z, x: entero;
    op: ('s', 'n');

    procedimiento cargar_arreglo es;
        esc('Ingrese el texto que desee encriptar.');
        esc('Aclaración: Por cada letra debe presionar ENTER.');

        i:= 1;
        repetir
            esc('Caracter n°i', i);
            leer(arr[i]);

            si (i < 255) entonces
                esc('¿Desea encriptar otro caracter? s/n');
                leer(op);
                si (op = 's') entonces
                    i:= i + 1;
                fin_si
            sino
                op:= 'n';
            fin_si
        hasta_que (op = 'n');
    fin_procedimiento

    encriptar = registro
        mult: n(5);
        prox: puntero a encriptar;
    fin_registro

    r: puntero a encriptar;

    encriptado = registro
        info: entero;
        prox: puntero a encriptado;
    fin_registro

    q, primq, rq: puntero a encriptado;

proceso
    cargar_arreglo();
    primq:= NIL;
    para z:= 1 hasta_que i hacer
        /* Primero, creamos los enlaces con una carga encolada. */
        nuevo(q);
        *q.prox:= NIL;

        si (primq = NIL) entonces
            primq:= q;
        sino
            *rq.prox:= q;
        fin_si
        rq:= q;

        /* Buscamos el código de encriptación según la posición del caracter. */
        r:= prim;
        para x:= 1 hasta_que z hacer
            r:= *r.prox;
        fin_para

        /* Cargamos la info encriptada. */
        resultp:= ascii(arr[z]) * *r.mult;
        result:= 0;

        mientras (resultp <> 0) hacer
            result:= result + resultp mod 10;
            resultp:= resultp div 10;
        fin_mientras

        *q.info:= result;

    fin_para

    /* Emitimos el mensaje encriptado. */
    q:= primq;
    mientras (q <> NIL) hacer
        esc(*q.info);
        q:= *q.prox;
    fin_mientras

fin_acción.
