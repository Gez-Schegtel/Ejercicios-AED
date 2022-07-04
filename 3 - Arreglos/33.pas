
//Ver consignas en el campus porque tiene una foto

Acción 32 (arr1: arreglo[a..n] de enteros) ES;
Ambiente 
  x: real;
  y: real;

Proceso 
  esc('Por favor, ingrese un número real mayor o igual a cero.');
  leer(x);
  
  y:= 0;
  para i:= 1 hasta arr1[n] hacer 
    
    y:= y + arr1[i] * x**i;
    
  fin_para
  
  esc('La sumatoria es igual a ', y);
  
Fin_Acción.
