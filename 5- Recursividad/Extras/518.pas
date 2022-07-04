
{

Dado un vector de 10 números enteros, calcular la suma de sus elementos

Caso base: i = 10 ; pr:= john_lays[i]

Caso recursivo: i < 10 ; pr:= john_lays[i] + pr(i+1)
}

program something;
uses crt;
type
    gimpsy_puckie = array [1..10] of integer;
var
    john_lays: gimpsy_puckie;
    i: integer;

    procedure cargar_arreglo ();
    begin
        writeln('Ingrese 10 número para almacenarlos en un arreglo.');

        for i:= 1 to 10 do
        begin
            write(i, ' Elemento >> ');
            readln(john_lays[i]);
        end;
    end;

    function pr(i: integer): integer;
    begin
        if i = 10 then
        begin
            pr:= john_lays[i];
        end
        else
            begin
                if i < 10 then
                begin
                    pr:= john_lays[i] + pr(i+1);
                end;
            end;
    end;

    procedure present;
	begin
			{
			Arte en ASCII generado en el sitio web " https://es.rakko.tools/tools/68/ ", utilizando la imagen que se encuentra a continuacion...
			https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.tztemuRaDOj-_ZH1Ho8ZCAHaHa%26pid%3DApi&f=1
			}
			clrscr;
			delay(30); textcolor(magenta); 		writeln('          -----:     :-----     :-----         ');
			delay(30); textcolor(blue); 		writeln('          #####+     *####*     +#####         ');
			delay(30); textcolor(white); 		writeln('          +#####.    *####*    .#####*         ');
			delay(30); textcolor(lightblue);	writeln('          :#####*    *####*    +#####-         ');
			delay(30); textcolor(green);		writeln('           +#####*.  *####*  .*#####*          ');
			delay(30); textcolor(cyan);		writeln('           .*######+:*####*:+######*.          ');
			delay(30); textcolor(red);		writeln('            .*####################*.           ');
			delay(30); textcolor(lightcyan);	writeln('              -##################=             ');
			delay(30); textcolor(lightgray); 	writeln('               .=*############*=.              ');
			delay(30); textcolor(lightgreen);	writeln('          ::::::::-+*######*+-::::::::         ');
			delay(30); textcolor(brown);		writeln('         .############################.        ');
			delay(30); textcolor(white);		writeln('          ############################.        ');
			delay(30); textcolor(yellow);		writeln('          ############################.        ');
			delay(30); textcolor(magenta);		writeln('          =========+*######*+=========         ');
			delay(30); textcolor(red); 		writeln('                :=*###########=:               ');
			delay(30); textcolor(cyan); 		writeln('              .+################+:             ');
			delay(30); textcolor(green); 		writeln('             =####################=            ');
			delay(30); textcolor(lightmagenta);	writeln('            +#######=*####*=#######+           ');
			delay(30); textcolor(blue);		writeln('           =######-  *####*  -######=          ');
			delay(30); textcolor(red);		writeln('          .######.   *####*   .*#####:         ');
			delay(30); textcolor(lightblue);	writeln('          +#####:    *####*    :#####+         ');
			delay(30); textcolor(lightgreen);	writeln('          #####*     *####*     +#####         ');
			delay(30); textcolor(magenta);		writeln('          +++++-     =++++=     -+++++         ');
			delay(800); clrscr;
			textcolor(lightgray);
	end;

begin
    present();
    cargar_arreglo();
    i:= 1;
    writeln('La suma de los elementos del arreglo es: ', pr(i));
end.
