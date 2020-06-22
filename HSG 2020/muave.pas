function min(a, b, c: longint):longint;
begin
  min := 3600 * 5000 + 1; // Tong gia tri MAX
  if (a < min) and (a > 0) then min := a;
  if (b < min) and (b > 0) then min := b;
  if (c < min) and (c > 0) then min := c;
  if min = 3600 * 5000 + 1 then min := 0;
end;

var
  f: text;
  i, n: word;
  a, b, c: array[-2..5000] of longint;
  m: longint;
begin
  fillchar(a, sizeof(a), 0);
  fillchar(b, sizeof(b), 0);
  fillchar(c, sizeof(c), 0);

  assign(f, 'muave.inp'); reset(f);
    readln(f, n);
    for i := 1 to n do
    begin
      readln(f, a[i], b[i], c[i]);
      // writeln(a[i], ' ' , b[i], ' ', c[i]);
    end;
  close(f);

  for i := 1 to n do
  begin
    m := min(a[i - 1], b[i - 2], c[i - 3]);
    inc(a[i], m);
    inc(b[i], m);
    inc(c[i], m);
    // writeln(i, ': ', a[i], ' ' , b[i], ' ', c[i]);
  end;
  // writeln('a[n], b[n - 1], c[n - 2]: ', a[n], ', ' , b[n - 1], ', ', c[n - 2]);
  write(min(a[n], b[n - 1], c[n - 2]));
end.