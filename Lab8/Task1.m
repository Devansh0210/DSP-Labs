f = [100, 200, 400, 600, 800, 1000, 1200, 1400];
fs = 5e3;
t = 0:1/fs:0.1;
fn = fs/2;



x = zeros(1, length(t));
for k = f
    x = x + sin(2*pi*k*t);
end

freqresp = @(t) abs(fftshift(fft(t)))/length(t);
freq = linspace(-fs/2, fs/2, length(t));

figure;
subplot(2, 1, 1);
plot(t, x);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title('$x(t)$', 'Interpreter', 'latex');

subplot(2, 1, 2);
plot(freq, freqresp(x));
xlabel('Frequency', 'Interpreter', 'latex');
ylabel('Magnitude', 'Interpreter', 'latex');
title('$|X(f)|$', 'Interpreter', 'latex');
xlim([-2000, 2000]);

% -----------------------------
Wp = 100/fn;
Rp = 0.01;
Ws = 200/fn;
Rs = 50;
[n, Wn] = buttord(Wp, Ws, 0.01, 50);
[b, a] = butter(n, Wn, 'low');
x_bw = filter(b, a, x);

[n, Wn] = cheb1ord(Wp, Ws, 0.01, 50);
[b, a] = cheby1(n, Rp, Wn, 'low');
x_ch1 = filter(b, a, x);

[n, Wn] = cheb2ord(Wp, Ws, 0.01, 50);
[b, a] = cheby2(n, Rs, Ws, 'low');
x_ch2 = filter(b, a, x);

[n, Wn] = ellipord(Wp, Ws, 0.01, 50);
[b, a] = ellip(n, Rp, Rs, Wp, 'low');
x_ellip = filter(b, a, x);

x_time = [x_bw', x_ch1', x_ch2', x_ellip']';
x_freq = [];
for l = 1:4
    x_freq = [x_freq freqresp(x_time(l, :))'];
end
x_freq = x_freq';
% 
figure;
for l = 1:4
    subplot(4, 2, 2*l-1);
    plot(t, x_time(l, :));
    
    subplot(4, 2, 2*l);
    plot(freq, x_freq(l, :));  
end
% --------------------------------

Wp = 1400/fn;
Rp = 0.01;
Ws = 800/fn;
Rs = 50;
[n, Wn] = buttord(Wp, Ws, 0.01, 50);
[b, a] = butter(n, Wn, 'high');
x_bw = filter(b, a, x);

[n, Wn] = cheb1ord(Wp, Ws, 0.01, 50);
[b, a] = cheby1(n, Rp, Wp, 'high');
x_ch1 = filter(b, a, x);

[n, Wn] = cheb2ord(Wp, Ws, 0.01, 50);
[b, a] = cheby2(n, Rs, Ws, 'high');
x_ch2 = filter(b, a, x);

[n, Wn] = ellipord(Wp, Ws, 0.01, 50);
[b, a] = ellip(n, Rp, Rs, Wp, 'high');
x_ellip = filter(b, a, x);

x_time = [x_bw', x_ch1', x_ch2', x_ellip']';
x_freq = [];
for l = 1:4
    x_freq = [x_freq freqresp(x_time(l, :))'];
end
x_freq = x_freq';
% 
figure;
for l = 1:4
    subplot(4, 2, 2*l-1);
    plot(t, x_time(l, :));
    
    subplot(4, 2, 2*l);
    plot(freq, x_freq(l, :));  
end

% ------------------------------------
Wp = [400, 1000]/fn;
Rp = 0.01;
Ws = [100, 1400]/fn;
Rs = 50;
[n, Wn] = buttord(Wp, Ws, 0.01, 50);
[b, a] = butter(n, Wn, 'bandpass');
x_bw = filter(b, a, x);

[n, Wn] = cheb1ord(Wp, Ws, 0.01, 50);
[b, a] = cheby1(n, Rp, Wp, 'bandpass');
x_ch1 = filter(b, a, x);

[n, Wn] = cheb2ord(Wp, Ws, 0.01, 50);
[b, a] = cheby2(n, Rs, Ws, 'bandpass');
x_ch2 = filter(b, a, x);

[n, Wn] = ellipord(Wp, Ws, 0.01, 50);
[b, a] = ellip(n, Rp, Rs, Wp, 'bandpass');
x_ellip = filter(b, a, x);

x_time = [x_bw', x_ch1', x_ch2', x_ellip']';
x_freq = [];
for l = 1:4
    x_freq = [x_freq freqresp(x_time(l, :))'];
end
x_freq = x_freq';
% 
figure;
for l = 1:4
    subplot(4, 2, 2*l-1);
    plot(t, x_time(l, :));
    
    subplot(4, 2, 2*l);
    plot(freq, x_freq(l, :));  
end

