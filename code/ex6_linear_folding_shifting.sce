clear;
clc;

// Exercise 6 - Linear convolution using folding and shifting / direct sum
// x(n) = [1, 2, -3, 2, 1], n starts at 0
// h(n) = [1, 0, -1],       n starts at 0

x = [1 2 -3 2 1];
h = [1 0 -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

y = zeros(1, Ly);

// y(n) = sum_k h(k) x(n-k)
for n = 0:Ly-1
    acc = 0;

    for k = 0:Lh-1
        index_x = n - k;

        if index_x >= 0 & index_x <= Lx-1 then
            acc = acc + h(k+1) * x(index_x+1);
        end
    end

    y(n+1) = acc;
end

mprintf("Exercise 6 - folding and shifting method\n");
disp(x, "x(n) =");
disp(h, "h(n) =");
disp(y, "y(n) =");

// Energy
Ex_seq = abs(x).^2;
Ey_seq = abs(y).^2;
Ex = sum(Ex_seq);
Ey = sum(Ey_seq);

mprintf("Energy of x(n) = %g\n", Ex);
mprintf("Energy of y(n) = %g\n", Ey);

// Draw x(n), y(n), and energy in the same figure.
nx = 0:Lx-1;
ny = 0:Ly-1;

scf();
clf();

subplot(2,2,1);
plot2d3(nx, x);
xgrid();
xtitle("x(n)", "n", "Amplitude");

subplot(2,2,2);
plot2d3(ny, y);
xgrid();
xtitle("Linear convolution y(n)", "n", "Amplitude");

subplot(2,2,3);
plot2d3(nx, Ex_seq);
xgrid();
xtitle("|x(n)|^2", "n", "Energy/sample");

subplot(2,2,4);
plot2d3(ny, Ey_seq);
xgrid();
xtitle("|y(n)|^2", "n", "Energy/sample");
