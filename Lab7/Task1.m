f = [10, 200, 1250, 1300, 2450];
fs = 1000;

t = 0:1/fs:5;
N = length(t);
y = zeros(1, length(t));

for k = f
    y = y + sin(2*pi*k*t);
end

spect = @(t) abs(fft(t))/fs;

freq = linspace(0, fs/2, N/2);
mag = spect(y);
mag = mag(1:ceil(N/2-1));

figure;
plot(freq, mag);
xlabel('Frequency', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('Spectrum', 'Interpreter', 'latex');
grid on;

fprintf("As we know, by nyquist theorem maximum frequency compenent can be detected without aliasing will be \n");
disp("fs/2, so here 100 and 200 can be seen, but 1250, 1300, 2450 can be seen as aliased component as 1250-1000 = 250");
disp("1300-1000=300 and 2450-2*1000=450");
