A =[1	1/2	1/3	1/4	1/5	1/6	1/7	1/8	1/9;
    2	1	1/2	1/3	1/4	1/5	1/6	1/7	1/8;
    3	2	1	1/2	1/3	1/4	1/5	1/6	1/7;
    4	3	2	1	1/2	1/3	1/4	1/5	1/6;
    5	4	3	2	1	1/2	1/3	1/4	1/5;
    6	5	4	3	2	1	1/2	1/3	1/4;
    7	6	5	4	3	2	1	1/2	1/3;
    8	7	6	5	4	3	2	1	1/2;
    9	8	7	6	5	4	3	2	1];

[vectors, values] = eig(A);

values = diag(values);
[max_value, max_index] = max(real(values));

disp(values);

vector = vectors(:, max_index)

W1 = real(vector) / sum(real(vector))

W = W1 / max(W1)


x = 1:length(W1);
y = W1;

p_poly = polyfit(x, y, 2); % квадратичная
y_poly = polyval(p_poly, x);

x_fine = 1:0.1:length(W1);
y_spline = spline(x, y, x_fine);

% График сравнения
figure;
plot(x, y, 'bo-', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(x, y_poly, 'r--', 'LineWidth', 2);
plot(x_fine, y_spline, 'g-', 'LineWidth', 1);
legend('Исходные веса', 'Полиномиальная', 'Сплайн', 'Location', 'best');
grid on;
ylabel('Вес');

