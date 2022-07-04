

Para cada una de las consignas siguientes, genere un algoritmo que permita solucionarla (3 algoritmos) usando un arreglo de 100 números enteros:

    Almacenar 100 números.
    Localizar el número de mayor valor y el de menor valor, informar sus valores y sus posiciones.
    Contar y sumar todos los números pares.


Acción 31A ES;
Ambiente
  arr1: arreglo[1..100] de entero;
  i: entero;

Proceso
  para i:= 1 hasta 100 hacer
    esc('Ingrese un número.');
    leer(arr1[i]);
  fin_para
Fin_Acción.

Acción 31B ES;
Ambiente
  arr1: arreglo[1..100] de entero;
  i: entero;
  may: entero;
  men:entero;
  pmay:entero;
  pmen:entero;

Proceso
  para i:= 1 hasta 100 hacer
    esc('Ingrese un número.');
    leer(arr1[i]);
  fin_para

  may:= arr1[1];
  men:= arr1[1];
  pmay:= 1;
  pmen:= 1;

  para i:=2 hasta 100 hacer
    si (arr1[i] >= may) entonces
      may:= arr1[i];
      pmay:= i;
    fin_si

    si (arr1[i] <= men) entonces
      men:= arr1[i];
      pmen:= i;
    fin_si
  fin_para

  esc('El mayor elemento es ', may, ' y se encontró en la posición ', pmay);
  esc('El menor elemento es ', men, ' y se encontró en la posición ', pmen);

Fin_Acción.


Acción 31C ES;
Ambiente
  arr1: arreglo[1..100] de entero;
  i: entero;
  cont_par: entero;
  acuml_par: entero;

Proceso
  para i:= 1 hasta 100 hacer
    esc('Ingrese un número: ');
    leer(arr1[i]);
  fin_para

  cont_par:= 0;
  acuml_par:= 0;

  para i:= 1 hasta 100 hacer
    si ((arr1[i] mod 2) = 0) entonces
      cont_par:= cont_par + 1;
      acuml_par:= acuml_par + arr[i];
    fin_si
  fin_para

  esc('Se encontraron ', cont_par, ' números pares.');
  esc('La sumatoria de todos ellos da como resultado ', acuml_par);

Fin_Acción.











