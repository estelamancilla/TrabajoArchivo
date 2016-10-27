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
var 
    datos : file of registro;
    M : ARRAY [1..120] of registro ;
    T : ARRAY [1..30] of registro;
    D : ARRAY [1..120] of real;
    i:integer;
    r : registro;
    CANT:integer;
    TOTAL:Integer;
    CT1:Integer;
    CT2:Integer;
    CT3:Integer;
    x2:integer;
    y2:integer;
    
    resultado:string;
    x: real;
    y: real;
function distancia (x1,y1,x2,y2:real):Real;
    begin
        distancia:= sqrt(power(x1-x2,2)+power(y1-y2,2));
                  
    end;

procedure calcular_diferencia(x: real; y:real);
var i : integer;
   
    begin
        For i:=1 to 120 do
            D[i] := distancia(x,y, m[i].Petal_Length, m[i].Petal_Width);
    end;  

procedure ordenar () ;
var
i: integer;
j: integer;
aux_d:real;
aux_m : registro;
    begin

    aux_d:=0;
        for i:= 1 to 119 do
         begin
         
           for j := i+1 to 120 do
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

    for i:= 1 to 30 do
       begin
          writeln(i, ' ', t[i].Species, t[i].Petal_Length, t[i].Petal_Width);
          readkey ();
       end;

{for i:= 1 to 120 do 
    begin
        readln(x);
        readln(y);
        resultado:=calcular_diferencia(x,y);
        writeln(resultado);
        readkey();
    end;
 

 for i:= 1 to k do
   
}  
end.