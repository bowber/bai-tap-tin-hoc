var f: text;
    a: array [0..251, 0..251] of char;
    i, j, n, m: byte;
    t: string;
    soi, cuu, tongSoi, tongCuu : longint;

procedure dfs(i, j: byte);
var x, y: byte;
begin
if a[i, j] = 'o' then inc(cuu)
else if a[i, j] = 'v' then inc(soi);

a[i, j] := '#';

if a[i, j - 1] <> '#' then dfs(i, j - 1);
if a[i, j + 1] <> '#' then dfs(i, j + 1);
if a[i - 1, j] <> '#' then dfs(i - 1, j);
if a[i + 1, j] <> '#' then dfs(i + 1, j);
end;


begin
tongSoi := 0;
tongCuu := 0;

fillchar(a, sizeof(a), '#');

assign(f, 'soicuu.in'); reset(f);
readln(f, n, m);


for i := 1 to n do
begin
  readln(f, t);
  for j := 1 to m do
    a[i, j] := t[j];
end;
close(f);

{for i := 0 to n + 1 do
  writeln(i, ': ', a[i]);}

for i := 1 to n do
  for j := 1 to m do
    if a[i, j] <> '#' then
    begin
      soi := 0;
      cuu := 0;
      DFS(i, j);
      if cuu > soi then inc(tongCuu, cuu)
      else inc(tongSoi, soi);
    end;
assign(f, 'soicuu.out'); rewrite(f);

write(f, tongCuu, ' ', tongSoi);

close(f);
end.