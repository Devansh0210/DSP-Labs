%% Task-1
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
disp("---------------------------------------------");
%% Task-2
f = [100, 200, 300, 400];
fs = 1000;

t = 0:1/fs:1;
N = length(t);
y = zeros(1, length(t));

for k = f
    y = y + sin(2*pi*k*t);
end

spect = @(t) fftshift(abs(fft(t)))/fs;

off = 10;
freq = linspace(-fs/2, fs/2, N);
ideal_fil = fftshift(double(abs(freq) >= 200-off & abs(freq) < 300+off));

signal = y;
fil_signal = real(ifft(fft(y).*ideal_fil));


figure;
subplot(2, 2, 1);
plot(t, signal);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$x(t)$', 'Interpreter', 'latex');
xlim([0 0.2]);
grid on;

subplot(2, 2, 3);
plot(freq, spect(signal));
hold on;
plot(freq, fftshift(ideal_fil));
hold off;
xlabel('Frequency(Hz)', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('$X(f)$ and $H(f)$', 'Interpreter', 'latex');
legend(["Signal $x(t)$", "Filter $h(t)$"], 'interpreter', 'latex');
grid on;

subplot(2, 2, 2);
plot(t, fil_signal);
xlim([0 0.2]);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$y(t)$', 'Interpreter', 'latex');
grid on;

subplot(2, 2, 4);
plot(freq, spect(fil_signal));
xlabel('Frequency(Hz)', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('$Y(f) = X(f)H(f)$', 'Interpreter', 'latex');
grid on;

%% Task-3

f = [100, 200, 300, 400];
fs = 1000;

t = 0:1/fs:1;
N = length(t);
y = zeros(1, length(t));

for k = f
    y = y + sin(2*pi*k*t);
end

spect = @(t) fftshift(abs(fft(t)))/fs;

num = [1, 0, 0, 0, 0, 1];
den = [2];

signal = y;
out_signal = filter(num, den, signal);

figure;
subplot(2, 2, 1);
plot(t, signal);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$x(t)$', 'Interpreter', 'latex');
% xlim([0 0.2]);
grid on;

subplot(2, 2, 3);
plot(freq, spect(signal));
xlabel('Frequency(Hz)', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('$X(f)$', 'Interpreter', 'latex');
grid on;

subplot(2, 2, 2);
plot(t, out_signal);
xlim([0 0.2]);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$y(t)$', 'Interpreter', 'latex');
grid on;

subplot(2, 2, 4);
plot(freq, spect(out_signal));
xlabel('Frequency(Hz)', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('$Y(f) = X(f)H(f)$', 'Interpreter', 'latex');
grid on;

fprintf("\n If we observe the response of Transfer Function by substituting z = exp(sT), s = j*2*pi*f, T = 1/fs \n");
fprintf("We can see that at f = 100, 300 value of z^(-5) i.e. exp(-j*f/fs*2*pi) will be exp(-j*pi) and exp(-j*3pi) \n");
fprintf("So, value of transfer function will be zero because of (1 + (-1))/2 \n");
fprintf("At other freq, value will be 1\n");