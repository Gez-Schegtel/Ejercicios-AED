Ejercicio 5.3.7
Escribir una función recursiva que encuentre el número de nodos de un árbol binario.

Accion (prim:puntero a nodo) ES 
Ambiente
    nodo = registro 
        dato: entero
        izq,der: puntero a nodo
    fin_registro

    funcion cant_n(p:puntero a nodo):entero ES 
        si (p = nil) entonces
            cant_n:=0
        sino 
            cant_n:=1 + cant_n(*p.izq) + cant_n(*p.der)
        fin_si
    fin_funcion

Proceso
    esc('La cantidad de nodos del arbol es: ', cant_n(prim))
fin_accion