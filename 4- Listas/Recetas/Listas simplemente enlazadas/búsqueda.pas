
program search;
uses
    crt;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
    end;

var
    primq, q, rq: puntero_a_nodo;

    top, i, udato: integer;

    procedure carga;
    begin
        // Haremos una carga encolada con valores aleatorios. //
        write('Ingrese el número de elementos con el que desee cargar la lista >> ');
        readln(top);

        randomize;
        primq:= NIL;
        for i:= 1 to top do
        begin
            new(q);
            q^.dato:= random(100);
            q^.prox:= NIL;

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;
        end;
        writeln;
    end;

    procedure emision;
    begin
        writeln('Contenido de la lista: ');
        textcolor(yellow);
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato, ' ');
            rq:= rq^.prox;
        end;
        writeln(#13#10);
    end;

    procedure busqueda;
    begin
        textcolor(lightgray);
        write('Ingrese el elemento que desee buscar en la lista >> ');
        readln(udato);

        rq:= primq;
        while (rq <> NIL) and (rq^.dato <> udato) do
            rq:= rq^.prox;

        if (rq <> NIL) then
            writeln('Se encontró el elemento.')
        else
            writeln('No se encontró el elemento.');
            
    end;

begin
    carga();
    emision();
    busqueda();
end.
