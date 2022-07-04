{

    Primero, repasemos arreglos en Pascal...

    program e58;
    var
        arr: array [1..10] of integer;
        i: integer;
    begin
        for i:= 1 to 10 do
            readln(arr[i]);
        for i:= 1 to 10 do
            writeln('Valor ', i, ' es >> ', arr[i]);
    end.

}

{
    Dado un vector de 10 número enteros, calcular la suma de sus elementos.

    Caso base: i = 1 ==> fr:= v[i];

    Caso recursivo: i > 1 ==> fr:= v[i] + fr(i - 1)
}

program e58; // Opción 1: Utilizando una función. //
var
    v: array [1..10] of integer;
    i: integer;

    procedure cargar_y_emitir;
    begin
        randomize; // Esta función hace que cada vez que se ejecute el programa los dígitos aleatorios sean realmente diferentes
        for i:= 1 to 10 do
        begin
            v[i]:= random(100);
            writeln(i, '° valor >> ', v[i]);
        end;
        write(#13#10);
    end;

    function fr(i: integer): integer;
    begin
        if (i = 1) then
            fr:= v[i]
        else
            fr:= v[i] + fr(i - 1);
    end;

begin
    cargar_y_emitir();
    writeln('El valor de la sumatoria de estos elementos es: ', fr(i));
end.


{
    Caso base: i = 1 ==> sum:= 0;

    Caso recursivo: i > 1 ==> pr(i - 1)
}
{
program e58; // Opción 2, utilizando un procedimiento. //
var
    v: array [1..10] of integer;
    i, sum: integer;

    procedure cargar_y_emitir;
    begin
        randomize;
        for i:= 1 to 10 do
        begin
            v[i]:= random(100);
            writeln(i, '° valor >> ', v[i]);
        end;
        writeln;
    end;

    procedure pr(i: integer);
    begin
        if (i = 1) then
            sum:= 0
        else
            pr(i - 1);

        sum:= sum + v[i];
    end;

begin
    cargar_y_emitir();
    pr(i);
    writeln('El valor de la sumatoria de estos números es >> ', sum);
end.
}
