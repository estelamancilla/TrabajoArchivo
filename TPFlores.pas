program iris;
uses crt;

type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;

var 
    datos : file of registro;
    M : ARRAY [1..120] of registro ;
    T : ARRAY [1..30] of registro;
    i : integer;
    r : registro;
    CANT:integer;
    TOTAL:Integer;
    CT1:Integer;
    CT2:Integer;
    CT3:Integer;
begin
    CT3:=1;
    CT2:=1;
    TOTAL:=1;
    CANT:=1;
    CT1:=1;
    Assign(datos, 'iris.dat');
    Reset(datos);
    while not Eof(datos) do
    begin
        read(datos, r);
              
        if (r.species) = 'setosa' then
        begin  
            If CT1 <= 10 then 
            begin
                T[CANT]:= r;
                CANT:= CANT+1;
                CT1:= CT1+1;    
            end
            else 
            begin
                M[TOTAL]:= r;
                TOTAL:= TOTAL+1; 
            end; 
        end;
    

        if (r.species) = 'versicolor' then
        begin
            if ct2<= 10 then
            begin      
                T[CANT]:= r;
                CANT:=CANT+1;
                CT2:= CT2+1;
            end
            else
            begin
                M[TOTAL]:= r;
                TOTAL:= TOTAL+1;
            end;
        end; 


        if (r.species) = 'virginica' then
        begin
            if ct3<=10 then
            begin
                T[CANT]:= r;
                CANT:=CANT+1;
                CT3:= CT3+1;
            end
            else 
            begin
                M[TOTAL]:= r;
                TOTAL:=TOTAL+1;  
            end;
        end;
    end;//end while
    

    close(datos);

    for i := 1 to 30 do
    begin
      writeln(i, ' ', t[i].Species, t[i].Petal_Length, t[i].Petal_Width);
      readkey ();
      end;

end.