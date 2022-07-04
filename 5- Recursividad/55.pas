
{
        División entera con restas sucesivas.

        Caso base: a = 0 ==> fr:= c

        Caso recursivo: a > 0 ==> c:= c + 1; fr:= fr(a - b, b)
}

program e55; // Opción 1: Se me ocurrió a mí. //
var
    a, b, c: integer;

    function fr(a, b: integer): integer;
    begin
        if (a = 0) then
            fr:= c
        else
            begin
                c:= c + 1;
                fr:= fr(a - b, b);
            end;
    end;

begin
    c:= 0;
    writeln('Ingrese números enteros.');
    write('Dividendo: ');
    readln(a);
    write('Divisor: ');
    readln(b);
    writeln(a, '/', b, ' = ', fr(a, b));
end.


{
    Caso base: a = 0 ==> fr:= 0

    Caso recursivo: a > 0 ==> fr:= 1 + fr(a - b, b)


 program e55; // Opción 2: Ni empedo se me ocurría. //
 var
    a, b: integer;

    function fr(a, b: integer): integer;
    begin
        if (a = 0) then
            fr:= 0
        else
            fr:= 1 + fr(a - b, b);
    end;

begin
    writeln('Ingrese números enteros.');
    write('Dividendo: ');
    readln(a);
    write('Divisor: ');
    readln(b);
    writeln(a, '/', b, ' = ', fr(a, b));
end.
}
