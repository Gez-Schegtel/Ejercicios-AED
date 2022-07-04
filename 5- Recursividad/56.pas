
{
    Determinar si un número es par o impar utilizando restas.

    Caso base: a = 0 ==> writeln('El número es par');

    Caso recursivo: a > 0 ==> pr(n - 2)


program e56; // Procedimiento recursivo. //
var
    n: integer;

    procedure pr(n: integer);
    begin
        if (n = 0) then
            writeln(' es par.')
        else
            if (n < 0) then
                writeln(' no es par.')
            else
                pr(n - 2);
    end;

begin
    write('Ingrese un número para determinar si es par o no: ');
    readln(n);
    write('El número ', n);
    pr(n);
end.

}

{
    Caso base: n = 0 ==> fr:= 1

    Caso recursivo: n > 0 ==> fr:= fr(n - 2)

    Si n < 0 el número no es par.
}

program e56;
var
    n: integer;

    function fr(n: integer): integer;
    begin
        if (n = 0) then
            fr:= 1
        else
            if (n < 0) then
                fr:= 0 // Esto se hace para que no quede indefinida la función. //
            else
                fr:= fr(n - 2);
    end;
begin
    write('Ingrese un número: ');
    readln(n);

    if (fr(n) = 1) then
        writeln('El número ingresado es par.')
    else
        writeln('El número ingresado no es par.');
end.
