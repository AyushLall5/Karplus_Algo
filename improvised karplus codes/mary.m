%mary had a little lamb:

clear;
notes;   %load note frequencies

%getexcitesignal;

e = audioread('excite-picked-nodamp.wav');
e = e';

fs = 44100;

%loop filter:
B = [0.8995 0.1087];
A = [1 0.0136];

o = 3;   %octave
nd = .3; %note duration
p = .9;  %pluck position

L = [ kspluck(E(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(C(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(E(o), 2*nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(D(o), 2*nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(G(o), nd, fs, e, B, A, p) kspluck(G(o), 2*nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(C(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p) kspluck(C(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(D(o), nd, fs, e, B, A, p) kspluck(E(o), nd, fs, e, B, A, p)  kspluck(D(o), nd, fs, e, B, A, p) kspluck(C(o), 4*nd, fs, e, B, A, p) ];

audiowrite('mary.wav',L,fs);
soundsc(L,fs);
figure(1);
freqz(B,A);

figure(2);
zplane(B,A);
title("Pole-Zero Plot");