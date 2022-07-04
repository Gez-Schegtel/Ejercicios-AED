

{
Construir un algoritmo recursivo que permita determinar si los dígitos de un número n dado son todos pares.

Caso base: n = 0 ; rp:= 1 (o sea, verdadero)

Caso recursivo: n MOD 2 = 0 ; rp:= rp(n DIV 10)
}

program something;
uses crt;
var
    n: longint;

    function rp(n: longint): longint;
    begin
        if (n = 0) then
        begin
            rp:= 1;
        end
        else
            if (n MOD 2 = 0) then
            begin
                rp:= rp(n DIV 10);
            end
            else
                begin
                    rp:= 0;
                end;
    end;


begin
    writeln('Por favor, ingrese un número para determinar si todos sus dígitos son pares o no.');
    write('Número >> ');
    readln(n);

    if (rp(n) = 1) then
    begin
        textcolor(lightblue);
        writeln(#13#10, ' ") ', #13#10);
    end
    else
        begin
            textcolor(lightred);
            writeln(#13#10, ' =[ ', #13#10);
        end;
end.
