x = [1, 6, 1, 4];
h = [4, 5, 0, 6, 0, 9];

y = conv(x, h);
yc = cconv(x, h);
yc2 = cconv(x, h, max(length(x), length(h)));
figure;
subplot(3, 1, 1);
stem(y);
grid on;
xlabel('n', 'interpreter', 'latex');
title('Linear Convolution', 'interpreter', 'latex');

subplot(3, 1, 2);
stem(yc);
xlabel('n', 'interpreter', 'latex');
title('Circular Convolution', 'interpreter', 'latex');
grid on;
disp("Since Linear Convolution will have points from ")

subplot(3, 1, 3);
stem(yc2);
xlabel('n', 'interpreter', 'latex');
title('Circular Convolution', 'interpreter', 'latex');
grid on;

disp("Now, if we take N-point Cicular convolution where N = max(size(x), size(h)) then, there will be aliasing which we can observe by shifting and adding linear convolution by N,")
disp(y);
disp([zeros(1, 6) y]);
disp([zeros(1, 6) fix(yc2)]);
