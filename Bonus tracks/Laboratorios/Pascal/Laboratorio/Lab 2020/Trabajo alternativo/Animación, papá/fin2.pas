program finalizando_hermosamente_opcion_2;
uses crt;
var
	i: smallint;
Begin
	for i:= 1 to 1 do
	begin
		TextColor(LightGray);write('Finalizando el programa');
		delay(100);TextColor(LightBlue);write(' >');delay(100);write('>');delay(100);write('>');delay(100);write('>');delay(100);
		ClrScr;
		TextColor(LightGray);write('Finalizando el programa');
		delay(100);TextColor(LightGreen);write(' >');delay(100);write('>');delay(100);write('>');delay(100);write('<');delay(100);
		ClrScr;
		TextColor(LightGray);write('Finalizando el programa');
		delay(100);TextColor(LightMagenta);write(' >');delay(100);write('>');delay(100);write('<');delay(100);write('<');delay(100);
		ClrScr;
		TextColor(LightGray);write('Finalizando el programa');
		delay(100);TextColor(Cyan);write(' >');delay(100);write('<');delay(100);write('<');delay(100);write('<');delay(100);
		ClrScr;
		TextColor(LightGray);write('Finalizando el programa');
		delay(100);TextColor(White);write(' <');delay(100);write('<');delay(100);write('<');delay(100);write('<');delay(100);
		ClrScr;
	end;
End.

{Colores disponibles:
						Black 0 
						Blue 1 
						Green 2 
						Cyan 3 
						Red 4 
						Magenta 5 
						Brown 6 
						Light Gray 7 
						Dark gray 8 
						Light Blue 9 
						Light Green 10 
						Light Cyan 11 
						Light Red 12 
						Light Magenta 13
						Yellow 14 
						White 15 
						Blink 128}