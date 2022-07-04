
{
    Convertir un número dado a binario.

    Caso base: n = 1 ==> write(n mod 2)

    Caso recursivo: n <> 1 ==> pr(n div 2)
}

program e524;
var
    n: integer;

    procedure pr(n: integer);
    begin
        if (n <> 1) then
            pr(n div 2);

        write(n mod 2);
    end;

begin
    write('Ingrese un número para convertirlo a binario: ');
    readln(n);
    pr(n);
    writeln;
end.
