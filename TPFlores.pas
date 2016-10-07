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
begin
    i := 1;
    Assign(datos, 'iris.dat');
    Reset(datos);
    while not Eof(datos) do
    begin
        read(datos, r);
        writeln(i, ' ', r.Species, r.Petal_Length, r.Petal_Width);
        i := i +1;
    end;
    Reset (datos);
    while not Eof (Datos) do
      begin
        If species = T1 do
          begin 
          If CT1<= 10 do 
            begin
             T:=    
            end;
      end;

    close(datos);

end.