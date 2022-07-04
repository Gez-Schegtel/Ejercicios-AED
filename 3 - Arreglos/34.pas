  
Considerando un arreglo de 50 números enteros, confeccione un algoritmo para resolver las siguientes consignas:

    Modificar el arreglo dado, de modo que todos sus elementos sean múltiplos de 3.
    Crear otro arreglo que contenga los números que no cumplieron la condición.
    Informar cuántos números cumplieron la condición.


  
Acción 34 ES;
Ambiente
  arr1: arreglo[1..50] de enteros;
  arr2: arreglo[1..50] de enteros;
  i: entero;
  cont_cond: entero;
  
Proceso
  para i:= 1 hasta 50 hacer 
    esc('Ingrese un número: ');
    leer(arr1[i]);
  fin_para
  
  cont_cond:= 0;
  para i:= 1 hasta 50 hacer 
    si (arr1[i] mod 3 = 0) entonces
      cont_cond:= cont_cond + 1;
    sino 
        arr2[i]:= arr1[i];
        arr1[i]:= arr1[i] * 3;
    fin_si
  fin_para 
  
  esc('Número de elementos que cumplieron la condición >> ', cont_cond);
Fin_Acción.
  
  
  
  
  
  
  
