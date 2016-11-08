program iris;
uses crt,math;
const k = 5;
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
    x1:real;
    y1:real;
    S: real;
    opcion: integer;
    Resultado: string;

    function distancia (x1,y1,x2,y2:real):Real;
         begin
            distancia:= sqrt(power(x1-x2,2)+power(y1-y2,2));
         end;

    procedure ordenar_por_distancia (x1: real; y1:real);
        var i:integer;
            aux_d:real;
            aux_m : registro;
        begin
                CTver:= 0;
                CTS:=0;
                CTVir:=0;
                For i:=1 to 120 do
                begin
                    D[i] := distancia(x1,y1, m[i].petal_Length, m[i].petal_Width);
                end;
                
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
    function predecir_tipo(x: real; y:real):string;
    var i :integer;
    cantidad_setosa : integer;
    cantidad_virginica : integer;
    cantidad_versicolor : integer;
    begin
        ordenar_por_distancia(x,y);
        cantidad_setosa:=0;
        cantidad_versicolor:=0;
        cantidad_virginica:=0;
        for i := 1 to k do
          begin
                if m[i].species = 'setosa' then
                  cantidad_setosa := cantidad_setosa + 1;
                
                if m[i].species = 'virginica' then
                  cantidad_virginica := cantidad_virginica + 1;

                if m[i].species = 'versicolor' then
                  cantidad_versicolor := cantidad_versicolor + 1;

          end;

        if cantidad_setosa>cantidad_versicolor then
        begin
            if cantidad_setosa > cantidad_virginica then
              begin
                predecir_tipo:= 'setosa';
              end
              else
              begin
                predecir_tipo:='virginica';
              end;
        end 
        else
        begin
            if cantidad_versicolor > cantidad_virginica then
            begin
              predecir_tipo:= 'versicolor';
            end 
            else
            begin
              predecir_tipo:= 'virginica';
            end;
        end;
          //writeln(cantidad_setosa, cantidad_versicolor, cantidad_virginica);

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

    For i := 1 to 30 do
        begin
            if  predecir_tipo(T[i].sepal_Length, T[i].sepal_Width) = t[i].Species then
          begin
             S:= S+1;
          end;
            writeln(i, predecir_tipo(T[i].Petal_Length, T[i].Petal_Width), t[i].species);
            readkey();
            end;
    

    Writeln ('Precione 1 - Para Ingresar Las medidas');
    Writeln ('Precione 2 - Para calcular su porcentaje');
    Writeln ('Precione 3 - Para Finalizar Calculo');
    ReadLn (opcion);

    If opcion = 1 then
      begin
            Writeln ('ingrese el largo');
            ReadLn (x1);
            WriteLn ('Ingrese ancho');
            ReadLn (y1);
            Resultado:= predecir_tipo(x1,y1);
            writeln (Resultado);
            Readkey ()
        End 
        Else
    if opcion =2 then
      begin
        writeln ('El porcentaje es: '); writeln((S/30*100):3:2,'%');
        Readkey();
      end
      else
    if opcion =3 then 
    end.