program iris;

type registro = record
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;
type M = ARRAY [1..120] of integer;
Type T = ARRAY [1..30] of real;


var datos : file of registro;
    r : registro;
    i : integer;
    CANT:real;
    CANT1:real;
    CANT2: real;
    TOTAL:Integer;
    TOTAL1:real;
    TOTAL2: ;
    CT1:Integer;
    CT2:Integer;
    CT3:Integer;
begin
    i := 1;
    Assign(datos, 'iris.dat');
    Reset(datos);
while not Eof(datos) do
    begin
        read(datos, r);
              
        TOTAL2:=1;
        CANT2:=1;
        CT3:=1;
        TOTAL1:=1;
        CANT1:=1;
        CT2:=1;
        TOTAL:=1;
        CANT:=1;
        CT1:=1;
          begin  
             If CT1 <= 10 then 
                begin
                T[CANT]:= (r.species);
                CANT:= CANT+1;
                CT1:= CT1+1;    
                end
                  else 
                begin
                M[TOTAL]:= (r.species);
                TOTAL:= (TOTAL+1); 
                end; 
          end;
    end;

if (r.species) = 'versicolor' then
      begin
        if (r.specie )<= 10 then
                begin      
                T[CANT1]:= (r.species);
                CANT1:=CANT+1;
                CT2:= CT2+1;
                end
                else
                begin
                M[TOTAL1]:= (r.species);
                TOTAL1:= TOTAL1+1;
                end;
      end; 


if (r.species) = 'virginica' then
     begin
        if (r.species) <=10 then
                begin
                T[CANT2]:= (r.species);
                CANT2:=CANT2+1;
                CT3:= CT3+1;
                end
                else 
                begin
                M[TOTAL2]:= (r.species);
                TOTAL2:=TOTAL+1;  
                end;
     end;

        writeln(i, ' ', r.Species, r.Petal_Length, r.Petal_Width);
        i := i +1;
    

    close(datos);

end.