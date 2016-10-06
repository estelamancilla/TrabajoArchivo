//

Type Fecha = record
    Dia : Integer;
    Mes : integer;
    Anio : integer;
    Cotizacion : Real;
End;

Var f:file of fecha;
    registro : fecha;
    i : integer;
begin
    Assign (f, 'COTIZA.DAT');
    Rewrite (f);

    for i := 1 to 3 do
    begin
        
        readln(registro.dia);
        readln(registro.mes);
        readln(registro.Anio);
        readln(registro.Cotizacion);

        write(f, registro);

    end;

    reset(f);

  {  while not Eof(f) do
      begin
        ReadLn ();
        Fecha:= (RecordFecha);
        Max := Cot;
            Readln (Cot2);
                If Cot2 >= Max do
                Begin
                    Max:= Cot2;
                    Fecha:=
                end;
                Else
                begin
              
                end;
    
        
      end;

    
}

    
    Close(f);
end.
