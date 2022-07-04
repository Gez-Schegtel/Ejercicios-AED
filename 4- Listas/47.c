
/* En el arreglo tengo almacenadas todas las letras del abecedario. */
/* Voy a hacer de cuenta que me viene como un parámetro porque no tengo ganas de cargarlo. */
acción 47 (arr: arreglo de [1..27] de caracter) es;
ambiente
    nodo = registro
        dato: real;
        prox: puntero a nodo;
    fin_registro

    primq, q, rq, r: puntero a nodo;

    sec: secuencia de caracter;
    v: caracter;

    i, x, pmin, pmax: entero;

    min, max: real;

proceso
    arr(sec);
    avz(sec, v);

    /* Este nodo representa la letra a */
    nuevo(q);
    primq:= q;
    rq:= q;
    *q.prox:= NIL;
    *q.dato:= 0;

    /* Empieza a cargar desde la letra b */
    para i:= 1 hasta 26 hacer
        nuevo(q);
        *rq.prox:= q;
        rq:= q;
        *q.prox:= NIL;
        *q.dato:= 0;
    fin_para

    mientras NFDS(sec) hacer
        según (v) hacer
            a:  r:= primq;
                *r.dato:= *r.dato + 1;

            b:  r:= primq;
                r:= *r.prox;
                *r.dato:= *r.dato + 1;

            c:  r:= primq;
                para i:= 1 hasta 2 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            d:  r:= primq;
                para i:= 1 hasta 3 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            e:  r:= primq;
                para i:= 1 hasta 4 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            f:  r:= primq;
                para i:= 1 hasta 5 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            g:  r:= primq;
                para i:= 1 hasta 6 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            h:  r:= primq;
                para i:= 1 hasta 7 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            i:  r:= primq;
                para i:= 1 hasta 8 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            j:  r:= primq;
                para i:= 1 hasta 9 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            k:  r:= primq;
                para i:= 1 hasta 10 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            l:  r:= primq;
                para i:= 1 hasta 11 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            m:  r:= primq;
                para i:= 1 hasta 12 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            n:  r:= primq;
                para i:= 1 hasta 13 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            ñ:  r:= primq;
                para i:= 1 hasta 14 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            o:  r:= primq;
                para i:= 1 hasta 15 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            p:  r:= primq;
                para i:= 1 hasta 16 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            q:  r:= primq;
                para i:= 1 hasta 17 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            r:  r:= primq;
                para i:= 1 hasta 18 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            s:  r:= primq;
                para i:= 1 hasta 19 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            t:  r:= primq;
                para i:= 1 hasta 20 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            u:  r:= primq;
                para i:= 1 hasta 21 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            v:  r:= primq;
                para i:= 1 hasta 22 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            w:  r:= primq;
                para i:= 1 hasta 23 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            x:  r:= primq;
                para i:= 1 hasta 24 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            y:  r:= primq;
                para i:= 1 hasta 25 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;

            z:  r:= primq;
                para i:= 1 hasta 26 hacer
                    r:= *r.prox;
                fin_para
                *r.dato:= *r.dato + 1;
        fin_según

        leer(sec, v);
    fin_mientras

    r:= primq;
    x:= 1;
    min:= HV;
    max:= LV;

    mientras (r <> NIL) hacer
        esc('Frecuencia de la letra ', arr[x], ' es: ', *r.dato);

        si (*r.dato < min) entonces
            min:= *r.dato;
            pmin:= x;
        fin_si

        si (*r.dato > max) entonces
            max:= *r.dato;
            pmax:= x;
        fin_si

        r:= *r.prox;
        x:= x + 1;
    fin_mientras

    esc('La letra con menor frecuencia de utilización es ', arr[pmin], ' con ', min, ' apariciones.');
    esc('La letra con mayor frecuencia de utilización es ', arr[pmax], ' con ', max, ' apariciones.');

    cerrar(sec);
fin_acción.

/* No controlé el ejercicio luego de realizarlo. */
/* No creo que listas sea la mejor estructura para este tipo de situaciones. */
