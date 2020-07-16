var f: text;
    S, n, k: integer;
    dem: longint = 0;
    b: array[0..1000] of byte; // day so duoc tao ra de dem to hop

procedure generate(i: integer);
var j, t: integer;
begin
  for j := b[i-1] to k do
    if S + j > n then break
    else
    begin
      b[i] := j;
      inc(S, j);
      if S = n then
      begin
        for t := 1 to i do write(b[t], ' ');
        writeln;
      end;
      if i < n then generate(i+1);
      dec(S, j);
    end;
end;

begin
  assign(f, 'change.inp'); reset(f);
  readln(f, n, k);
  close(f);
  S := 0;
  b[0] := 1;
  generate(1);
end.
