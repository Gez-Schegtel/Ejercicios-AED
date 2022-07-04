
{
    Algoritmo de Euclides para hallar el mínimo común denominador.
    O, al menos, mi interpretación del mismo xD

    Caso base: a mod b = 0 ==> fr:= eucl

    Caso recursivo: a mod b > 0 ==> eucl:= a mod b; fr:= fr(b, eucl)
}
program e57;
var
    a, b, eucl: integer;

    function fr(a, b: integer): integer;
    begin
        if (a mod b = 0) then
            fr:= eucl
        else
            begin
                eucl:= a mod b;
                fr:= fr(b, eucl);
            end;
    end;

begin
    writeln('Ingrese dos números enteros para hallar su mínimo común denominador (MCD).');
    writeln('Se utilizará el algoritmos de Euclides para su resolución.');
    write('A >> ');
    readln(a);
    write('B >> ');
    readln(b);
    writeln('El MCD entre ', a, ' y ', b,  ' es ', fr(a, b))
end.
