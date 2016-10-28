program iris;
uses crt,math;
const k = 3;
type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;
     tipo = record      
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                    Distancia : real;
                  end;
var 
    datos : file of registro;
    M : ARRAY [1..120] of registro ;
    T : ARRAY [1..30] of registro;
    D : ARRAY [1..120] of real;
    i,j:integer;
    r : registro;
    C:integer;
    Tot:Integer;
    CTver:Integer;
    CTS:Integer;
    CTVir:Integer;
    An:real;
    Lar:real;
    S: real;
    Tip: string;

    function distancia (x1,y1,x2,y2:real):Real;
         begin
            distancia:= sqrt(power(x1-x2,2)+power(y1-y2,2));
         end;

    function calcular (x1: real; y1:real):Real;
        var 
            aux_d:real;
            aux_m : registro;
            CTver: Integer;
            CTS:Integer;
            CTVir:Integer;
        begin
                CTver:= 0;
                CTS:=0;
                CTVir:=0;
                For i:=1 to 120 do
                begin
                    D[i] := distancia(x1,y1, m[i].Petal_Length, m[i].Petal_Width);
                end;
                begin  
                    For i:= 1 to 119 do
                        begin
                            for j := i+1 to 120 do
                                begin
                                    if D[i] > D[j] then
                                        begin 
                                            aux_d:= D[i];
                                            D[i]:= D[j];
                                            D[j]:= aux_d;
                                            Aux_m:=M[i];
                                            M[i]:=M[j];
                                            M[j]:= Aux_m;
                                        end;
                                end;   
                        end;
                end;
        end;
        
begin
    CTver:=1;
    CTS:=1;
    CTVir:=1;
    Tot:=1;
    C:=1;
    S:=0;
    Assign(datos, 'iris.dat');
    Reset(datos);
        while not Eof(datos) do
        begin
            read(datos, r);       
            if (r.species) = 'setosa' then 
            begin  
                If CTS <= 10 then 
                begin
                    T[tot]:= r;
                    Tot:= Tot+1;
                    CTS:= CTS+1;    
                end
                else 
                begin 
                    M[C]:= r;
                    C:= C+1; 
                end; 
            end;
        
            if (r.species) = 'versicolor' then
            begin
                if CTver<= 10 then
                begin      
                    T[Tot]:= r;
                    Tot:= Tot +1;
                    CTver:= CTver+1;
                end
                else
                begin
                    M[C]:= r;
                    C:= C+1;
                end;
            end; 

            if (r.species) = 'virginica' then
            begin
                if CTVir<= 10 then
                begin
                    T[Tot]:= r;
                    Tot:= Tot+1;
                    CTVir:= CTVir+1;
                end
                else 
                begin
                    M[C]:= r;
                    C:=C+1;  
                end;
            end;
        end;//end while
    close(datos);

    Writeln ('ingrese el largo');
    ReadLn (Lar);
    WriteLn ('Ingrese ancho');
    ReadLn (An);
        Tip := tipo (Lar,An);
        writeln (Tip);

    For i := 1 to 30 do
        begin
            if  tipo(T[i].Petal_Length, T[i].Petal_Width) = t[i].Species then
          begin
             S:= S+1;
          end;
    end;
    writeln((S/30*100):3:2,'%');
    Readkey();

end.