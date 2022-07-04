
{
    Calcular n-ésimo término de la sucesión de Fibonacci.

    Ejemplo:
            0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233,

    Caso base: n = 1 or n = 2 ==> fr:= 1

    Caso recursivo: n > 2 ==> fr:= fr(n - 1) + fr(n - 2)
}

program e52;
var
    n: longint;

    function fr(n: longint): longint;
    begin
        if (n = 1) then
            fr:= 0
        else
            if (n = 2) then
                fr:= 1
            else
                fr:= fr(n - 1) + fr(n - 2);
    end;

begin
    write('Ingrese el término de la sucesión de Fibonacci que desee saber: ');
    readln(n);
    writeln('Término ', n, ' de la sucesión de Fibonacci es ', fr(n));
end.
