Esta versión es para que funcione mejor en Windows, ya que desarrollé el código utilizando un sistema operativo GNU/Linux y algunas funciones al pasarlas a Windows no funcionaban como esperaba.

Por ejemplo, la función Blink, no se ejecutaba bien en Windows. Esta función no es más que estética, ya que sirve para que lo que esté adentro de un Write, o Writeln, haga pequeños destellos. Otra diferencia es que en GNU/Linux no es necesario agregar alguna función como ReadKey para que el programa no se cierre rápidamente luego de ser ejecutado.


Compilar desde PowerShell ==> fpc nombredelarchivo.pas
Ejecutar desde PowerShell ==> ./nombredelarchivo
