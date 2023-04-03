f = [350 440];
fs = 44100;
fc = 1e4;
ts = 1/fs;
t = 0:ts:15-ts;
kf = 10;
freq = linspace(-fs/2, fs/2, length(t));
x = 0.1*(cos(2*pi*f(1)*t) + cos(2*pi*f(2)*t));

x_fm = cos(2*pi*fc*t + 2*pi*kf*cumsum(x)*ts);
% sound(x, fs);

% Task-1
x_demod = 1000*[abs(hilbert(diff(x_fm))) 0];
x_demod = x_demod - mean(x_demod);
x_demod_f = fftshift(fft(x_demod));
figure;
subplot(2,1,1);
plot(t(1:end-1), x_demod(1:end-1));

subplot(2,1,2);
plot(freq, abs(x_demod_f));
xlim([-500 500]);

sound(x, fs);