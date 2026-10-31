clear;
clc;

// Exercise 7 - Circular convolution using the circulant matrix method

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

N = length(x);

if length(h) <> N then
    error("For this lab example, x(n) and h(n) must have the same length.");
end

// Build Hcirc so that:
// y(n) = sum_m Hcirc(n,m) x(m)
// with Hcirc(n,m) = h[(n-m) mod N]
Hcirc = zeros(N, N);

for n = 0:N-1
    for m = 0:N-1
        index_h = pmodulo(n-m, N);   // 0,...,N-1
        Hcirc(n+1, m+1) = h(index_h+1);
    end
end

y_col = Hcirc * x';
y = y_col';

mprintf("Exercise 7 - circular convolution, matrix method\n");
disp(Hcirc, "Circular convolution matrix H =");
disp(y, "y(n) =");

// Expected:
// y(n) = [4 -4 -3 0 3]
