Ejercicio 5.3.8
Escribir una función recursiva que encuentre la altura de un árbol binario.

funcion fr(p:puntero a nodo):entero  ES
ambiente 
    r1,r2: entero 

proceso 
    si (p = nil) entonces
        fr:=0
    sino 
        r1:= fr(*p.izq)
        r2:= fr(*p.der)
        si (r1 > r2) entonces
            fr:= 1 + r1 
        sino 
            fr:= 1 + r2
        fin_si
    fin_si 

fin_funcion