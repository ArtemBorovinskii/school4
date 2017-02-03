program zadacha_010;
var a_1,a_2,a_3,a_4:integer;
    prom:real;
begin
  readln(a_1,a_2,a_3,a_4);
  prom:=min(a_1,a_2)+min(a_3,a_4);
  while frac(sqrt(prom))<>0 do
    prom:=prom-1;
  writeln(sqrt(prom));
end.