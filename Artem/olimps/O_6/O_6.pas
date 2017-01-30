Program nO_6;
var F:text; R,stroka:string; i,j,L,err:integer; R_S,ch,s,p:real;
begin
  assign(F,'input.txt'); reset(F); readln(F); 
  readln(F,R); R:=R+'-';
  while eof(F)=false do
    begin
      readln(F,stroka);  
      L:=length(R);
      i:=0;
      while i<>L do
        begin
          i:=i+1;
          if (R[i]='-')or(R[i]='=')then
            if copy(stroka,1,3)=copy(R,i-3,3)then
              begin
                delete(R,i-3,3);
                insert(copy(stroka,pos('=',stroka)+1,length(stroka)),R,i-3);
                i:=i+length(copy(stroka,pos('=',stroka)+1,length(stroka)))-3;
                L:=length(R); 
              end;
        end;
    end;
  j:=1;
  for i:=1 to length(R) do
    begin
      if R[i]='=' then
        begin
          val(copy(R,j,i-j),ch,err);
          s:=s+1/ch;
          j:=i+1;
        end;
      if R[i]='-' then
        begin
          val(copy(R,j,i-j),ch,err);
          s:=s+1/ch;
          if s=1/ch then R_S:=R_S+ch
          else R_S:=R_S+1/s;
          j:=i+1;
          s:=0;
        end;
    end;
  close(F);
  assign(F,'output.txt');
  rewrite(F);
  write(F,R_S:2:3);
  close(F);
end.