Program butt_de_button_para_saber_tu_button;
uses Crt;

var
  c: Char;

begin
  Writeln('Pulsa una tecla');
  c := Readkey;
  Writeln(' Has pulsado ', c, ', cuyo codigo ASCII es ', Ord(c), '.');
  readkey();
end.