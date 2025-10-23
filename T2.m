% gaus 77.9182 255.89

A = [1    1/2  1/4  1/6  1/8  1/9  1/9  1/9;
            2    1    1/2  1/4  1/6  1/8  1/9  1/9;
            4    2    1    1/2  1/4  1/6  1/8  1/9;
            6    4    2    1    1/2  1/4  1/6  1/8;
            8    6    4    2    1    1/2  1/4  1/6;
            9    8    6    4    2    1    1/2  1/4;
            9    9    8    6    4    2    1    1/2;
            9    9    9    8    6    4    2    1];

[vectors, values] = eig(A);

values = diag(values);
[max_value, max_index] = max(real(values));

disp(values);

vector = vectors(:, max_index)

W1 = real(vector) / sum(real(vector))

W = W1 / max(W1)

x = linspace(0, 240, length(W)); 

figure;
plot(x, W, 'ro-', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'red');
grid on;

xlabel('Зарплата, тыс. руб.', 'FontSize', 12);
ylabel('Степень принадлежности', 'FontSize', 12);
title('Функция принадлежности: "Высокая зарплата"', 'FontSize', 14);

xlim([0, 240]);
xticks(0:30:240);

ylim([0, 1.1]);
yticks(0:0.1:1);



