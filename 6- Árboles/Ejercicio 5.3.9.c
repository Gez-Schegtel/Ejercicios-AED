Ejercicio 5.3.9
Se dispone de un árbol binario de enteros. Escribir funciones que calculen:

La suma de sus elementos.
La suma de sus elementos que son múltiplos de 3.

Accion (prim:puntero a nodo) ES 
Ambiente

    nodo = registro 
        dato:entero
        izq,der:puntero a nodo
    fin_registro

    funcion sumael(p:puntero a nodo):entero ES 
        si (p = nil) entonces
            sumael:=0
        sino 
            sumael:= *p.dato + sumael(*p.izq) + sumael(*p.der)
        fin_si
    fin_funcion
    
    funcion multr(p:puntero a nodo):entero ES;
        si (p=nil) entonces
            multr:=0
        sino 
            multr:= multr(*p.izq) + multr(*p.der)
            si (*p.dato mod 3 = 0) entonces 
                multr:= multr + *p.dato
            fin_si
        fin_si
    fin_funcion

Proceso
    esc('La suma del contenido de los nodos del arbol es: ', sumael)
    esc('La suma del contenido de los arboles que son multiplos de 3 es: ', multr)
fin_accion