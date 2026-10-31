clear;
clc;

// Exercise 6 - Linear convolution using the matrix method

x = [1 2 -3 2 1];
h = [1 0 -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

// Build the linear-convolution matrix from x.
// Xmat * h' gives the convolution result.
Xmat = zeros(Ly, Lh);

for row = 1:Ly
    for col = 1:Lh
        ix = row - col + 1;

        if ix >= 1 & ix <= Lx then
            Xmat(row, col) = x(ix);
        end
    end
end

y_col = Xmat * h';
y = y_col';

mprintf("Exercise 6 - matrix method\n");
disp(Xmat, "Convolution matrix X =");
disp(y, "y(n) =");

// Expected:
// y(n) = [1 2 -4 0 4 -2 -1]
