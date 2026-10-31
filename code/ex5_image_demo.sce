clear;
clc;

// Exercise 5 - Image processing demo using IPCV.
//
// First-time installation in the Scilab console:
//   atomsInstall("IPCV")
//
// Then restart Scilab if requested.
// Load the toolbox:
//   atomsLoad("IPCV")
//
// The demo reads an IPCV sample image, converts it to grayscale,
// displays both images, and plots a grayscale histogram.

atomsLoad("IPCV");

// IPCV includes sample images.
imgPath = fullpath(getIPCVpath() + "/images/baboon.png");
img = imread(imgPath);
gray = rgb2gray(img);

mprintf("Image file: %s\n", imgPath);
disp(size(img), "Original image size =");
disp(size(gray), "Grayscale image size =");

// Display original and grayscale images.
scf();
clf();

subplot(1,2,1);
imshow(img);
xtitle("Original image");

subplot(1,2,2);
imshow(gray);
xtitle("Grayscale image");

// Histogram of grayscale intensity.
// Convert the matrix to a vector for histplot.
g = double(matrix(gray, 1, -1));

scf();
clf();
histplot(0:255, g);
xgrid();
xtitle("Grayscale histogram", "Intensity", "Count");
