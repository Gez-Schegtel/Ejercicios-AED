
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
    primq, ultq, q, r, rr: puntero_a_nodo;

    top, i, udato: integer;

    op: char;

    procedure carga;
    begin
        randomize;

        write('Ingrese el número de elementos con el que desee cargar la lista >> ');
        readln(top);

        primq:= NIL;

        for i:= 1 to top do
        begin
            new(q);
            q^.dato:= random(100);

            rr:= NIL;
            r:= primq;

            while (r <> NIL) and (r^.dato <= q^.dato) do
            begin
                rr:= r;
                r:= r^.prox;
            end;

            if (rr = NIL) then
            begin
                // Primer elemento. //
                q^.ant:= NIL;
                q^.prox:= primq;

                // Condicional necesario para evitar bugs. Probar secuencia 7 9 3 2 1 //
                if (primq <> NIL) then
                    primq^.ant:= q;

                primq:= q;

            end
            else
                if (r = NIL) then
                begin
                    // Último elemento. //
                    q^.ant:= rr;
                    rr^.prox:= q;
                    q^.prox:= NIL;
                end
                else
                    begin
                        // Elemento del medio. //
                        rr^.prox:= q;
                        q^.ant:= rr;
                        q^.prox:= r;
                        r^.ant:= q;
                    end;

            // Condicional NECESARIO por si se ingresan valores ordenados de manera descendente. //
            if (q^.prox = NIL) then
                ultq:= q;

        end;

        writeln;
    end;

    procedure emitir;
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

        writeln(#13#10);
    end;

    procedure eliminar;
    begin
        write('Ingrese el número que desee eliminar a lista >> ');
        readln(udato);

        r:= primq;

        while (r <> NIL) and (r^.dato <> udato) do
            r:= r^.prox;

        if (r <> NIL) then
        begin
            if (r = primq) then
            begin
                primq:= primq^.prox;
                primq^.ant:= NIL;
            end
            else
                if (r = ultq) then
                begin
                    ultq:= ultq^.ant;
                    ultq^.prox:= NIL;
                end
                else
                    begin
                        (r^.ant)^.prox:= r^.prox;
                        (r^.prox)^.ant:= r^.ant;
                    end;

                dispose(r);
        end
        else
            writeln('No se encontró el elemento.', #13#10);

    end;

begin
    carga();
    emitir();

    repeat
        eliminar();
        emitir();

        writeln('¿Desea eliminar otro número a la lista? s/n');
        readln(op);
    until(op = 'n');
end.
