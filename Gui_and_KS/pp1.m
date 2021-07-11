fs=4400;
x = rand(1,100);
x = [ x zeros(1,5000)];
num = 1;
den = [ 1 zeros(1,99) -0.5 -0.5 ];
y = filter (num,den,x);
plot(y)
sound(y,fs);
audiowrite('Fsp.wav',y,fs);