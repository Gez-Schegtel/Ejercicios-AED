
{
Imprimir las cifras de un número n (siendo n ≥ 0) en orden inverso al original. Por ej.: el inverso de 254 es 452.

Caso base: n <= 9; writeln(n)

Caso recursivo: n > 0 ; write(n MOD 10) y fr(n DIV 10)
}

program something;
var
    n: integer;

    procedure fr(n: integer);
    begin
        if (n <= 9) then
        begin
            writeln(n);
        end
        else
            begin
                write(n MOD 10);
                fr(n DIV 10);
            end;
    end;

begin
    writeln('Ingrese un número.');
    readln(n);
    writeln('Este número al revés es... ');
    fr(n);
end.
