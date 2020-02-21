type edge = array[1..2] of longint;

var i, j, n: longint;
    a: array[1..1000000] of edge;
    f: text;
    all: array[0..1000000] of byte;
    
function existed(e: edge): boolean;
begin
if (all[e[1]] = 1) or (all[e[2]] = 1) then
begin
  all[e[1]] := 1;
  all[e[2]] := 1;
  exit(true);
end;
exit(false);
end;

procedure swap(var a, b: edge);
var t: edge;
begin
t := a;
a := b;
b := t;
end;

begin

fillchar(all, sizeof(all), 0);
n := 0;

assign(f, 'lamquen.inp'); reset(f);
while not eof(f) do
begin
  inc(n);
  readln(f, a[n, 1], a[n, 2]);
end;
close(f);

all[a[1, 1]] := 1;
all[a[1, 2]] := 1;

for i := 2 to n do
  for j := i to n do
    if existed(a[j]) then
    begin
      swap(a[i], a[j]);
      break;
    end;

if (all[a[n, 1]] = 0) or (all[a[n, 2]] = 0) then
  write(0)
else
  write(1);

end.
