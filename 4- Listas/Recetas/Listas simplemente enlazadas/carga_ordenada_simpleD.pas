

// Este programa consiste en la carga ordenada descendente de una lista simplemente enlazada. //
program carga_ordenada_simple;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
    end;

var
    primq, q, r, rr: puntero_a_nodo;

    udato: integer;

    procedure carga;
    begin
        writeln('Para finalizar el proceso de carga ordenada ingrese el número -1');

        write('>> ');
        readln(udato);

        primq:= NIL;

        while (udato <> -1) do
        begin
            new(q);
            q^.dato:= udato;

            rr:= NIL;
            r:= primq;

            while (r <> NIL) and (r^.dato >= udato) do
            begin
                rr:= r;
                r:= r^.prox;
            end;

            if (rr = NIL) then
            begin
                q^.prox:= primq;
                primq:= q;
            end
            else
                begin
                    rr^.prox:= q;
                    q^.prox:= r;
                end;

            write('>> ');
            readln(udato);
        end;

    end;

    procedure emision;
    begin
        r:= primq;

        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.prox;
        end;

        writeln;
    end;

begin
    carga();
    emision();
end.
