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