
program FIFO;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: string;
        prox: puntero_a_nodo;
    end;

var
    primq, q, rq: puntero_a_nodo;

    udato: string;

    procedure fifo;
    begin
        writeln('Para finalizar el proceso de carga encolada (FIFO) ingrese el caracter * ');
        write('>> ');
        readln(udato);

        primq:= NIL;
        while (udato <> '*') do
        begin
            new(q);
            q^.dato:= udato;
            q^.prox:= NIL;

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;

            write('>> ');
            readln(udato);
        end;
    end;

    procedure emision;
    begin
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato, ' ');
            rq:= rq^.prox;
        end;
        writeln;
    end;

begin
    fifo();
    emision();
end.
