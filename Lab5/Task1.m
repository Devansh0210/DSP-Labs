[x, fs] = audioread("si1188.wav");
x = x';
N = length(x);
% N-point DFT
n = N;
x_f = (fft(x, N));
% freq = [linspace(0,fs/2, n/2) linspace(-fs/2, -1, n/2)];
freq = 0:n-1;
t = (0:n-1)/fs;
figure;
subplot(3, 1, 1);
plot(t, x);
xlabel('n', 'Interpreter', 'latex');
ylabel('$x[n]$', 'Interpreter', 'latex');
title('Audio Signal($N$-point DFT)', 'Interpreter', 'latex');
grid on;

subplot(3,1,2);
plot(freq, abs(x_f));
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$|X[k]|$', 'Interpreter', 'latex');
grid on;

subplot(3,1,3);
plot(freq, wrapTo2Pi(angle(x_f)));
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$\angle X[k]$', 'Interpreter', 'latex');
ylim([-1 7]);
grid on;


figure;
x_f2 = (fft(x, 2*N));
freq = 0:2*N-1;
subplot(3, 1, 1);
plot(t, x);
xlabel('n', 'Interpreter', 'latex');
ylabel('$x[n]$', 'Interpreter', 'latex');
title('Audio Signal($2N$-point DFT)', 'Interpreter', 'latex');
grid on;

subplot(3,1,2);
plot(freq, abs(x_f2));
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$|X[k]|$', 'Interpreter', 'latex');
grid on;

subplot(3,1,3);
plot(freq, wrapTo2Pi(angle(x_f2)));
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$\angle X[k]$', 'Interpreter', 'latex');
ylim([-1 7]);
grid on;

disp("As we can see by increasing the N, we get more frequency resolution,");
disp("but in cost of more number of spikes in spectrum. We can prove this"); 
disp("by considering rectangular windows whose fourier transform is sinc"); 
disp("function which has many sidelobs");