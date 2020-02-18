type names = array [1..2] of ansistring;

function id(s: ansistring): ansistring;
begin
exit(#32 + s + #32);
end;

procedure swap(var a, b: names);
var t: names;
begin
t := a;
a := b;
b := t;
end;

function getName(s: ansistring):names;
begin
  getName[1] := copy(s, 1, pos(' ', s) - 1);
  getName[2] := copy(s, length(getName[1]) + 2, length(s) - length(getName[1]) + 2);
end;

procedure push(var team: ansistring; s: ansistring);
begin
if pos(s, team) <> 0 then exit;
team := team + s + ' ';
end;

var f: text;
    s, team_1, team_2: ansistring;
    a: array[1..10000] of names;
    n, i, j: longint;
begin
team_1 := ' ';
team_2 := ' ';
n := 0;
assign(f, 'dongho.inp'); reset(f);
while not eof(f) do
begin
  inc(n);
  readln(f, s);
  a[n] := getName(s);
end;
close(f);

push(team_1, a[1, 1]);
push(team_2, a[1, 2]);

for i := 2 to n do
begin
  for j := i to n do
  begin
     if pos(a[j, 1], team_1) <> 0 then
       push(team_2, a[j, 2])
     else if pos(a[j, 2], team_1) <> 0 then
       push(team_2, a[j, 1])
     else if pos(a[j, 1], team_2) <> 0 then
       push(team_1, a[j, 2])
     else if pos(a[j, 2], team_2) <> 0 then
       push(team_1, a[j, 1])
     else continue;
     break;
  end;
  swap(a[i], a[j]);
end;

team_1 := copy(team_1, 2, length(team_1) - 2);
team_2 := copy(team_2, 2, length(team_2) - 2);

writeln(team_1);
write(team_2);
end.
