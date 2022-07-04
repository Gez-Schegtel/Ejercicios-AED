
{
    Calcular el factorial de un número positivo n. Tener en cuenta la definición matemática de n!

    caso base: n = 0 ; fr:= 1
    caso recursivo: n <> 0 ; fr(n-1)
}

program something;
var
    n: longint;

    function fr(n: longint): longint;
    begin
        if (n = 0) then
        begin
          fr:= 1;
        end
        else
          begin
            fr:= n * fr(n-1);
          end;
    end;

begin
    writeln('Ingrese el número del que desee saber su factorial.');
    readln(n);
    writeln('El factorial del número es >> ', fr(n));
end.
