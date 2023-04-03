f1 = 170;
f2 = 390;
fs = 6630;

xn = @(n) cos(2*pi*f1/fs*n) + cos(2*pi*f2/fs*n);

N = [170, 390, 663, 200];
    
h = 1;
for k=N
    n = (0:k-1);
    x = xn(n);
    xf = abs(fft(x, k));
    subplot(4, 2, 2*h-1);
    plot(n, x); 
    xlabel('n', 'Interpreter', 'latex');
    ylabel('Amplitude', 'Interpreter', 'latex');
    title(sprintf('$x[n]$ for N = %d', k), 'Interpreter', 'latex');
    grid on;
    
    freq = linspace(0, fs-1, k);
    subplot(4, 2, 2*h);
    plot(freq, xf);
    xlabel('k', 'Interpreter', 'latex');
    ylabel('Amplitude', 'Interpreter', 'latex');
    title(sprintf('$|X[k]|$ for N = %d', k), 'Interpreter', 'latex');
    grid on;
    h = h+1;
end

k = 170;
n = (0:k-1);
x = xn(n);
xf = abs(fft(x, k));

fprintf("----------------------------------------------\n");
fprintf("For N = %d the f1 (170 Hz) is %spresent in the spectrum and f2 (390) is %spresent in the spectrum\n", N(1), "not ", "");
fprintf("For N = %d the f1 (170 Hz) is %spresent in the spectrum and f2 (390) is %spresent in the spectrum\n", N(2), "", "");
fprintf("For N = %d the f1 (170 Hz) is %spresent in the spectrum and f2 (390) is %spresent in the spectrum\n", N(3), "", "");
fprintf("For N = %d the f1 (170 Hz) is %spresent in the spectrum and f2 (390) is %spresent in the spectrum\n", N(4), "not ", "not ");
fprintf("----------------------------------------------\n");
disp("Here we can frequency spacing which is given by fs/N, so we need higher N for more ");
disp("frequency resolution, here we can clearly observe in case of N = 663 we are getting exact frequency");
disp("because resolution is high");
fprintf("----------------------------------------------\n");

figure;
subplot(3, 1, 1);
plot(n, x); 
xlabel('n', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title(sprintf('$x[n]$ for N = %d', k), 'Interpreter', 'latex');
grid on;

freq = linspace(0, fs-1, k);
subplot(3, 1, 2);
plot(freq, xf);
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title(sprintf('$|X[k]|$ for N = %d', k), 'Interpreter', 'latex');
grid on;

freq = linspace(-fs/2, fs/2, k);
subplot(3, 1, 3);
plot(freq, fftshift(xf));
xlabel('k', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title(sprintf('Shifted $|X[k]|$ for N = %d', k), 'Interpreter', 'latex');
grid on;