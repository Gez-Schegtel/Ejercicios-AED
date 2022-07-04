


Dada la siguiente declaración y el siguiente esquema:

    NODO = registro
        DATO: entero
        PROX: puntero a nodo
    fin_registro

    P, Q, R:  puntero a NODO

   P↓              Q↓               R↓
   _______        _______         _______
  | 3 |   |----→ | 5 |   | ----→ | 9 |nil|
   -------       ---------       --------

¿Qué hacen las siguientes órdenes?

Considerar que se ejecutan secuencialmente.

    $ P:= P↑. PROX $ /* Al puntero P, se le asigna la posición siguiente, la que coincide con Q. */
    $ Q:= P $ /* No hace nada, porque Q y P son equivalentes en este punto. */
    $ R:= P↑.PROX $ /* Ídem al paso anterior. R y *P.PROX son equivalente. */
    $ P↑.DATO:= Q↑. DATO $ /* Otra vez sopa, Pipa. */
    $ P↑.DATO:= (Q↑.PROX)↑. DATO $ /* Ahora P contiene el mismo dato que R, o sea, 9. */
    $ R↑.PROX:= P $ /* Ahora R en vez de apuntar a NIL, apunta a la dirección de P y Q. */
