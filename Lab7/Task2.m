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