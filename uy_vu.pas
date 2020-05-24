var a: array[1..10000] of integer;  
    n, q: integer;

procedure nhap_mang();
var i: integer;
    
begin
    write('Nhap n: ');
    readln(n);
    write('Nhap ', n, ' phan tu cach nhau mot khoang trang: ');
    for i := 1 to n do
        read(a[i]);
end;

procedure xuat_mang(arr: array of integer);
var i: integer;
begin
    for i := 0 to n - 1 do
        write(arr[i], ' ');
    writeln;
end;

function snt(val: integer): boolean;
var i: integer;
begin
    if val < 2 then exit(false);
    for i := 2 to round(sqrt(val)) do
        if val mod i = 0 then
            exit(false);
    exit(true);
end;


function f1(): integer;
var i, imin: integer;
begin
    imin := 1;
    for i := 1 to n do
        if snt(a[i]) then 
        begin
            writeln(a[i], ' la so nguyen to');
            if (a[i] < imin) or (imin = 1) then 
                imin := a[i];
        end;
    write(imin, ' la so nguyen to nho nhat');
end;


function f2(): integer;
var i: integer;
begin
    if a[1] < a[2] then writeln(a[1]);
    for i := 2 to n - 1 do
        if (a[i] < a[i - 1]) and (a[i] < a[i + 1]) then
            writeln(a[i]);
    if a[n] < a[n - 1] then writeln(a[n]);
end;


function f3(): integer;
var i, fir, sec: integer;
begin
    fir := a[1];
    for i := 2 to n do
    begin
        if a[i] > fir then
        begin
            sec := fir;
            fir := a[i]
        end
        else if a[i] > sec then
            sec := a[i];
    end;
    writeln(sec);
    
end;


function f4(): integer;
var i, max: integer;
    b: array[1..maxint] of integer;
begin
    max := 0;
    fillchar(b, sizeof(b), 0);
    for i := 1 to n do
        inc(b[a[i]]);
    for i := 1 to maxint do
        if b[i] > b[max] then max := i;
    writeln(max);
    
end;

function cphuong(val: integer): boolean;
begin
    if round(sqrt(val)) = sqrt(val) then
        exit(true);
    exit(false);
end;

function swap(var a, b: integer): integer;
begin
    swap := a;
    a := b;
    b := swap;
end;

function f5(): integer;
var i, j: integer;
begin
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if cphuong(a[i]) and cphuong(a[j]) then
                if a[i] > a[j] then 
                    swap(a[i], a[j]);
    xuat_mang(a);
end;


function f6(): integer;
var i, j, count: integer;
begin
    count := 1;
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if a[i] > a[j] then 
                    swap(a[i], a[j]);
    for i := 2 to n do
        if a[i] <> a[i - 1] then
            inc(count);
    writeln(count);
end;


function f7(): integer;
var i, j: integer;
begin
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if a[i] > a[j] then 
                    swap(a[i], a[j]);
    writeln(a[1]);
    for i := 2 to n do
        if a[i] <> a[i - 1] then
            writeln(a[i]);
end;


function f8(): integer;
var b: array[0..10000] of longint;
    i, m: integer;
    max: longint;
begin
    b[0] := 0;
    max := m;
    write('Nhap m: '); readln(m);
    for i := 1 to n do
        b[i] := b[i - 1] + a[i];
    for i := m to n do
        if b[i] - b[i - m] > b[max] - b[max - m]then
            max := i;
    for i := max - m + 1 to max do
        writeln(a[i]);
end;

var funcs: array [1..8] of function: integer = (@f1, @f2, @f3, @f4, @f5, @f6, @f7, @f8);
begin
    nhap_mang();
    xuat_mang(a);
    write('Nhap yeu cau (1 -> 8): '); 
    readln(q);
    funcs[q];
end.
