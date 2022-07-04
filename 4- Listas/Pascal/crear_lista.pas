



program listas_enlazadas;
uses crt;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: char;
        prox: puntero_a_nodo;
    end;
var
    q, rq, primq: puntero_a_nodo;

    {
    op: char;

    procedure crear_lista();
    begin
        repeat
            new(q);
            readln(q^.dato);

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;

            writeln('¿Desea ingresar otro caracter? s/n');
            readln(op);
        until (op = 'n');
    end;
    }

    {
    procedure crear_lista();
    begin
        writeln('Por cada caracter ingresado, debe presionar ENTER.');
        writeln('Para terminar el proceso, ingrese el caracter "+".');
        repeat
            new(q);
            readln(q^.dato);

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;

        until (q^.dato = '+');
    end;
    }

    valor: char;

    procedure mensajes();
    begin
        writeln('Para terminar el proceso, ingrese el caracter " * ".');
        writeln('Por cada valor ingresado, presione ENTER.');
        writeln('Ingrese un valor: ');
    end;

    procedure crear_lista();
    begin
        mensajes();
        write('>> ');
        readln(valor);

        primq:= NIL;
        while (valor <> '*') do
        begin
            new(q);
            q^.dato:= valor;
            q^.prox:= NIL;

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;

            write('>> ');
            readln(valor);
        end;
    end;

    procedure recorrer_lista();
    begin
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato);
            rq:= rq^.prox;
        end;

        writeln;
    end;

begin
  primq:= NIL;
  crear_lista();
  recorrer_lista();
end.
