clc;
close all;

Fs       = 64100;
A        = 110; % The A string of a guitar is normally tuned to 110 Hz
Eoffset  = -5;
Doffset  =  5;
Goffset  = 10;
Boffset  = 14;
E2offset = 19;


F = linspace(1/Fs, 1000, 2^12);

fret = [3 2 0 0 0 3];
delay = [round(Fs/(A*2^((fret(1)+Eoffset)/12))),
    round(Fs/(A*2^(fret(2)/12))), 
    round(Fs/(A*2^((fret(3)+Doffset)/12))), 
    round(Fs/(A*2^((fret(4)+Goffset)/12))), 
    round(Fs/(A*2^((fret(5)+Boffset)/12))), 
    round(Fs/(A*2^((fret(6)+E2offset)/12)))];

x = rand(1,100); %noise burst
x=[x zeros(1,4*Fs)];  
b = cell(length(delay),1);
a = cell(length(delay),1);
H = zeros(length(delay),4096);
note = zeros(length(x),length(delay));
for indx = 1:length(delay)
    
    b{indx} = 1;
    a{indx} = [1 zeros(1, delay(indx)-1) -0.5 -0.5];
    zi = rand(max(length(b{indx}),length(a{indx}))-1,1); %filter delay
    note(:,indx) = filter(b{indx},a{indx},x,zi);
    
   note(:, indx) = note(:, indx)-mean(note(:, indx));
 
    [H(indx,:),W] = freqz(b{indx}, a{indx},F, Fs);
    
end




combinedNote = sum(note,2);
combinedNote = combinedNote/max(abs(combinedNote));
sound(combinedNote, Fs); 
audiowrite('Fchord.wav',combinedNote,Fs);
plot(note); figure;
hline = plot(W,20*log10(abs(H)));
title('Harmonics of a G major chord');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend(hline,'E','A','D','G','B','E2');