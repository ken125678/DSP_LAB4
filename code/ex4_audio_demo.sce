clear;
clc;

// Exercise 4 - Audio processing demo using built-in Scilab sound functions.
// No extra toolbox is required.
//
// This demo:
//   1) reads a WAV file,
//   2) displays the waveform,
//   3) displays a magnitude spectrum,
//   4) optionally plays the sound.

audioFile = SCI + "/modules/sound/demos/chimes.wav";

[y, Fs, bits] = wavread(audioFile);

mprintf("Audio file: %s\n", audioFile);
mprintf("Sampling frequency Fs = %d Hz\n", Fs);
mprintf("Bit depth = %d bits\n", bits);
mprintf("Number of channels = %d\n", size(y, 1));
mprintf("Samples per channel = %d\n", size(y, 2));

// Use the first channel if the audio is multichannel.
x = y(1, :);
N = length(x);
t = (0:N-1) / Fs;

// Frequency-domain representation
X = fft(x);
N2 = floor(N/2);
f = (0:N2-1) * Fs / N;
magX = abs(X(1:N2));

scf();
clf();

subplot(2,1,1);
plot(t, x);
xgrid();
xtitle("Audio waveform", "Time (s)", "Amplitude");

subplot(2,1,2);
plot(f, magX);
xgrid();
xtitle("Magnitude spectrum", "Frequency (Hz)", "|X(f)|");

// Uncomment if you want to hear the audio:
// playsnd(x, Fs);
