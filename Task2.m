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

% Plotting x_2[n]
subplot(3, 2, 2);
stem(t1, x2);
grid on;

% Plotting |X_1[k]|
subplot(3, 2, 3);
stem(abs(Xf1));
grid on;

% Plotting |X_2[k]|
subplot(3, 2, 4);
stem(abs(Xf2));
grid on;

% Plotting x_3[n]
subplot(3, 2, 5);
stem(x3);
grid on;

% Plotting |X_3(k)|
subplot(3, 2, 6);
stem(abs(Xf3));
grid on;


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