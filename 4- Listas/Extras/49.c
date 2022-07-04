

Dada una lista circular de 8 elementos que contienen, cada uno, un valor numérico entero para encriptación, encriptar un texto ingresado por teclado (arreglo de caracteres de 255 elementos como máximo). El texto encriptado debe almacenarse en una lista de salida simplemente encadenada y, por último mostrar por pantalla.

    ENCRIPTAR
    | Multiplicador >>N(5)<< | Prox >>Puntero<< |

La encriptación se realiza según las siguientes pautas:

    1. Dada la posición del carácter dentro del texto, buscar en la lista circular de encriptación el multiplicador correspondiente, de acuerdo a su posición lógica en la lista. Por ejemplo: como solo hay 8 multiplicadores, si se ingresa un arreglo de 10 caracteres, para encriptar los ultimos dos se utilizarían los multiplicadores 1 y 2.

    2. Se usa la función ASCII(Carácter) para convertir cada carácter del arreglo en un entero.

    3. Luego se multiplican los valores obtenidos en los 2 pasos anteriores.

    4. Por último se descompone el resultado obtenido en 3 en cada uno de sus dígitos, se los suma y se guarda en la lista de salida. Ej: si en el paso 3 me dio 123, 1+2+3=6.


acción 49 (prim: puntero a ENCRIPTAR) ES;
ambiente
    ENCRIPTAR = registro
        multip: n(5);
        prox: puntero a ENCRIPTAR;
    fin_registro

    e: puntero a ENCRIPTAR;

    ENCRIPTADO = registro
        e_text: n(5);
        prox: puntero a ENCRIPTADO;
    fin_registro

    s, sprim, sant: puntero a ENCRIPTADO;

    arr1: arreglo [1..255] de caracter;
    i: (1..255);
    j: (1..255);
    l_control: (1..255);

    acuml: entero;
    to_trans: entero;

    op: ('S', 'N');

    procedimiento init_arr() ES;
        para i:= 1 hasta 255 hacer
            arr1[i]:= 0;
        fin_para
    fin_procedimiento

    procedimiento enter_text() ES;
        l_control:= 1;
        op:= 'S';

        esc('Ingrese caracter a caracter lo que desee encriptar.');

        mientras ((op = 'S') y (l_control <= 255)) hacer

            leer(arr[l_control]);
            esc('¿Desea seguir escribiendo?');
            leer(op);
            l_control:= l_control + 1;

        fin_mientras

    fin_procedimiento

proceso
    init_arr();
    enter_text();

    e:= prim;
    sprim:= NIL;
    acuml:= 0;

    para i:= 1 hasta l_control hacer

        para j:= 1 hasta i hacer
            e:= *e.prox;
        fin_para

        to_trans:= *e.multip * ASCII(arr[i]); /* Se usa la función, papito */

        mientras (to_trans DIV 10 <> 0) hacer
            acuml:= acuml + to_trans MOD 10;
            to_trans:= to_trans DIV 10;
        fin_mientras

        /* Realizamos una carga encolada */
        nuevo(s);
        *s.prox:= NIL;
        *s.e_text:= acuml;

        si (sprim = NIL) entonces
            sprim:= s;
        sino
            *sant.prox:= s;
        fin_si
        sant:= s;

    fin_para

    s:= sprim;
    mientras (s <> NIL) hacer
        esc('Código >> ', *s.e_text);
        s:= *s.prox;
    fin_mientras

fin_acción.
