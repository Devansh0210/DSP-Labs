%% Task-1
x = [10, -5, 2, 0, 7, 19, 3, 8, 4, 2, 10, 12];
h1 = [1, 2, 3, 4];
h2 = [1, 1, 1, 1];

y1 = lin_conv(x, h1);
y1 = lin_conv(y1, h2);


disp("Final Output y[n] : "); disp(y1);
figure;
stem(y1);
xlabel('$n$', 'interpreter', 'latex');
ylabel('$y[n]$',  'interpreter', 'latex')
title('$y[n] = x[n] \ast h_1[n] \ast h_2[n]$',  'interpreter', 'latex')
grid on;
%% Task-2
fs = 100;
f1 = 10;
p1 = 5;

t1 = 0:1/fs:p1/f1;
t1 = t1(1:end-1);

x1 = sin(2*pi*f1*t1);
x2 = sin(2*pi*f1*t1 + pi/4);

a = 10;
b = 5;

x3 = a*x1 + b*x2;

Xf3 = DFS(x3, 10);
Xf2 = DFS(x2, 10);
Xf1 = DFS(x1, 10);

Xf3_ = a*Xf1 + b*Xf2;

% We can verify Xf3_ == Xf3, thus we can verify linearity property

figure;

% Plotting x_1[n]
subplot(3, 2, 1);
stem(t1, x1);
grid on;
xlabel('Time Samples', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$x_1[n]$', 'interpreter', 'latex');

% Plotting x_2[n]
subplot(3, 2, 2);
stem(t1, x2);
grid on;
xlabel('Time Samples', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$x_2[n]$', 'interpreter', 'latex');

% Plotting |X_1[k]|
subplot(3, 2, 3);
stem(abs(Xf1));
grid on;
xlabel('Frequency', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$|X_1[k]|$', 'interpreter', 'latex');

% Plotting |X_2[k]|
subplot(3, 2, 4);
stem(abs(Xf2));
grid on;
xlabel('Frequency Samples', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$|X_2[k]|$', 'interpreter', 'latex');

% Plotting x_3[n]
subplot(3, 2, 5);
stem(x3);
grid on;
xlabel('Time Samples', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$x_3[n]$', 'interpreter', 'latex');

% Plotting |X_3(k)|
subplot(3, 2, 6);
stem(abs(Xf3));
grid on;
xlabel('Frequency Samples', 'interpreter', 'latex');
ylabel('Amplitude', 'interpreter', 'latex');
title('$|X_3[k]|$', 'interpreter', 'latex');


% DFS Function
function y = DFS(x, N)
    y = [];
    x1 = x(1:N); % Tasking first N samples, others are repeated
    
    DF_matrix = exp(-i*2*pi/N*(0:1:N-1));
    for n=0:1:N-1
        y = [y sum(x1.*(DF_matrix.^n))];
    end
     
    y = repmat(y, 1, length(x)/N); % Repeating X[k] because it has fundamental period of 'N'
end

% Linear Convolution
function y = lin_conv(x, h)
    N1 = length(x);
    N2 = length(h); 
    n = N1 + N2 - 1;
    x = [x zeros(1,n-N1)];
    h = [h zeros(1,n-N2)];
    y = zeros(1,n);
    for k=1:n
        for j=1:k
            y(k) = y (k)+x(j)*h(k-j+1);
        end
    end
end