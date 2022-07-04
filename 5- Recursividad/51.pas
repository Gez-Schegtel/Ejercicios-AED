
{
    Calcular el factorial de un número.

    Ejemplo:
            0! = 1
            4! = 4*3*2*1 = 24
            8! = 8*7*6*5*4*3*2*1 = 40320

    Caso base: n = 0 ==> fr:= 1

    Caso recursivo: n > 0 ==> fr:= n * fr(n - 1)
}

program e51;
var
    n: longint;

    function fr(n: longint): longint;
    begin
        if (n = 0) then
            fr:= 1
        else
            fr:= n * fr(n - 1);
    end;

begin
    write('Ingrese un número para hallar su factorial: ');
    readln(n);
    writeln(n, '! = ', fr(n));
end.
