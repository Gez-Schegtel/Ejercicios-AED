
program LIFO;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: string;
        prox: puntero_a_nodo;
    end;

var
    primq, q: puntero_a_nodo;

    udato: string;

    procedure lifo;
    begin
        writeln('Para finalizar el proceso de carga apilada (LIFO) ingrese el caracter * ');
        write('>> ');
        readln(udato);

        primq:= NIL;
        while (udato <> '*') do
        begin
            new(q);
            q^.dato:= udato;
            q^.prox:= primq;
            primq:= q;

            write('>> ');
            readln(udato);
        end;
    end;

    procedure emision;
    begin
        q:= primq;
        while (q <> NIL) do
        begin
            write(q^.dato, ' ');
            q:= q^.prox;
        end;
        writeln;
    end;

begin
    lifo();
    emision();
end.
