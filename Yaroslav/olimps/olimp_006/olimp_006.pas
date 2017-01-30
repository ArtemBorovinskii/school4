program zadacha_6;
var f:text;
    par,pos:char;
    baza:array of real;
    str,str2:string;
    i,n,err:integer;
    R,R1:real;
begin
  par:='=';
  pos:='-';
  assign(f,'input.txt');
  reset(f);
  readln(f,n);
  setlength(baza,n);
  readln(f,str);
  for i:=0 to n-1 do
    begin
      readln(f,str2);
      val(copy(str2,5,length(str2)),baza[i],err);
    end;
  str:='-'+str+'-';
  while str<>'-' do
    begin
      R1:=0;
      if (str[1]=pos)and(str[5]<>par) then
        begin
          val(copy(str,3,2),n,err);
          R:=R+baza[n-1];
          delete(str,1,4);
          continue;
        end;
      if (str[1]=pos)and(str[5]=par)then
        begin
          while (str[5]<>pos)do
            begin
              val(copy(str,3,2),n,err);
              R1:=R1+1/baza[n-1];
              delete(str,1,4);
            end;
          val(copy(str,3,2),n,err);
          R1:=R1+1/baza[n-1];
          delete(str,1,4);
          R:=R+1/R1;
        end;
    end;
  close(f);
  assign(f,'output.txt');
  rewrite(f);
  writeln(f,R:5:3);
  close(f);
end.