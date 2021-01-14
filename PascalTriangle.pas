{Prueba del triangulo de pascal en Pascal}

program PascalTriangle (output);

uses
    crt, sysutils;
var
    Levels : integer;
type
{ Creamos un nuevo tipo }
	Values = array of integer;
	PValues = ^Values;


function CalculateLevel (Level: integer):PValues;
var
	i : integer;
	Result1 : PValues;
	PResult : PValues;

begin

	new(Result1);
	Setlength(Result1^, Level);
	
	
	if (Level = 1) then
	begin
		Result1^[1]:= 1;
    end;

	if (Level = 2) then
	begin
		Result1^[1]:= 1;
		Result1^[2]:= 1;
	end;
	if (Level > 2) then
	begin
		PResult := CalculateLevel(Level - 1);
		for i := 1 to Level do
		begin
			if (i = 1) or (i = Level) then
			begin
				Result1^[i] := 1;
			end
			else
			begin
				Result1^[i] := PResult^[i] + PResult^[i - 1];
			end;
		end;
	end;
	exit(Result1);
end;

procedure DrawPascalTriangle(Number : integer);
var
	i,j : integer;
	Result1 : PValues;
begin
    if (Number > 20) then
    begin
        writeln('El nivel maximo es 20');
    end
    else
    begin
        for i := 1 to (Number) do
    	begin
            Result1 := CalculateLevel(i);
			for j := 1 to i do
			begin
				write(Result1^[j],' ');
			end;
			writeln();
        end;
    end;
end;

{Programa principal}
begin
    writeln('Ingresa el numero de niveles');
    readln(Levels);
    DrawPascalTriangle(Levels);
    writeln('Listo');
end.
