
// Este programa consiste en una carga ordenada ascendente en una lista doblemente enlazada. //
program carga_ordenada_doble;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
        ant: puntero_a_nodo;
    end;

var
    primq, ultq, q, rq, r: puntero_a_nodo;

    udato: integer;

    procedure carga;
    begin
        writeln('Para finalizar el proceso ingrese el número -1');

        write('>> ');
        readln(udato);

        primq:= NIL;

        while (udato <> -1) do
        begin
            new(q);
            q^.dato:= udato;
            q^.prox:= NIL;
            ultq:= q;

            if (primq = NIL) then
            begin
                primq:= q;
                q^.ant:= NIL;
            end
            else
                begin
                    rq^.prox:= q;
                    q^.ant:= rq;
                end;

            rq:= q;

            write('>> ');
            readln(udato);
        end;
    end;

    procedure emision;
    begin
        writeln('Lista desde primq: ');

        r:= primq;
        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.prox;
        end;

        writeln(#13#10, 'Lista desde ultq: ');

        r:= ultq;
        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.ant;
        end;

        writeln;
    end;

begin
    carga();
    emision();
end.
