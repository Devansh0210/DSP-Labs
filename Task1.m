x = [10, -5, 2, 0, 7, 19, 3, 8, 4, 2, 10, 12];
h1 = [1, 2, 3, 4];
h2 = [1, 1, 1, 1];

y1 = lin_conv(x, h1);
y1 = lin_conv(y1, h2);


disp("Final Output : "); disp(y1);
figure;
stem(y1);
grid on;

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
