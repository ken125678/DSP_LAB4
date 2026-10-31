clear;
clc;

// Exercise 7 - N-point circular convolution using folding and shifting
// x(n) = [1, 2, -3, 2, 1]
// h(n) = [1, 0, -1, -1, 1]
// N = 5

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

N = length(x);
M = length(h);

if M <> N then
    error("For this lab example, x(n) and h(n) must both have length N.");
end

y = zeros(1, N);

// y(n) = sum_{k=0}^{N-1} h(k) x[(n-k) mod N]
//
// IMPORTANT:
// In Scilab, use pmodulo() here instead of modulo().
// For negative arguments, pmodulo() always gives an index
// in the range 0,...,N-1. Then +1 converts it to Scilab's
// 1-based array index.

for n = 0:N-1
    acc = 0;

    for k = 0:N-1
        index_x = pmodulo(n-k, N);   // 0,...,N-1
        acc = acc + h(k+1) * x(index_x+1);
    end

    y(n+1) = acc;
end

mprintf("Exercise 7 - circular convolution, folding and shifting\n");
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

n = 0:N-1;

scf();
clf();

subplot(2,2,1);
plot2d3(n, x);
xgrid();
xtitle("x(n)", "n", "Amplitude");

subplot(2,2,2);
plot2d3(n, y);
xgrid();
xtitle("Circular convolution y(n)", "n", "Amplitude");

subplot(2,2,3);
plot2d3(n, Ex_seq);
xgrid();
xtitle("|x(n)|^2", "n", "Energy/sample");

subplot(2,2,4);
plot2d3(n, Ey_seq);
xgrid();
xtitle("|y(n)|^2", "n", "Energy/sample");
