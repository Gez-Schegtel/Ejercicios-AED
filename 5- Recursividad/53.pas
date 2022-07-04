
{
    Calcular la potencia b**e utilizando mult. sucesivas.

    Ejemplo:
        2**5 = 2 * 2 * 2 * 2 * 2 = 32

    Caso base: e = 1 ==> fr:= b

    Caso recursivo: e > 1 ==> fr:= b * fr(b, e - 1)
}

program e53;
var
    b, e: longint;

    function fr(b, e: longint): longint;
    begin
        if (e = 1) then
            fr:= b
        else
            fr:= b * fr(b, e - 1);
    end;

begin
    write('Ingrese la base: ');
    readln(b);
    write('Ingrese el exponente: ');
    readln(e);
    writeln('El resultado de ', b, '^', e, ' es ', fr(b, e));
end.
