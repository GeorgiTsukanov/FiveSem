salary_universe = [0 30 60 90 120 150 180 210 240];

low_salary_matrix = [
    1    2    3    4    5    6    7    8    9;
    1/2  1    2    3    4    5    6    7    8;
    1/3  1/2  1    2    3    4    5    6    7;
    1/4  1/3  1/2  1    2    3    4    5    6;
    1/5  1/4  1/3  1/2  1    2    3    4    5;
    1/6  1/5  1/4  1/3  1/2  1    2    3    4;
    1/7  1/6  1/5  1/4  1/3  1/2  1    2    3;
    1/8  1/7  1/6  1/5  1/4  1/3  1/2  1    2;
    1/9  1/8  1/7  1/6  1/5  1/4  1/3  1/2  1
];

medium_salary_matrix = [
    1    1/2  1/3  1/4  1/5  1/6  1/7  1/8  1/9;
    2    1    1/2  1/3  1/4  1/5  1/6  1/7  1/8;
    3    2    1    1/2  1/3  1/4  1/5  1/6  1/7;
    4    3    2    1    2    3    4    5    6;
    5    4    3    1/2  1    2    3    4    5;
    6    5    4    1/3  1/2  1    2    3    4;
    7    6    5    1/4  1/3  1/2  1    2    3;
    8    7    6    1/5  1/4  1/3  1/2  1    2;
    9    8    7    1/6  1/5  1/4  1/3  1/2  1
];

high_salary_matrix = [
    1    1/2  1/3  1/4  1/5  1/6  1/7  1/8  1/9;
    2    1    1/2  1/3  1/4  1/5  1/6  1/7  1/8;
    3    2    1    1/2  1/3  1/4  1/5  1/6  1/7;
    4    3    2    1    1/2  1/3  1/4  1/5  1/6;
    5    4    3    2    1    1/2  1/3  1/4  1/5;
    6    5    4    3    2    1    1/2  1/3  1/4;
    7    6    5    4    3    2    1    1/2  1/3;
    8    7    6    5    4    3    2    1    1/2;
    9    8    7    6    5    4    3    2    1
];
fprintf('Низкая зп\n');
[W_low, lambda_low] = func(low_salary_matrix, salary_universe);

fprintf('\nСредняя зп\n');
[W_medium, lambda_medium] = func(medium_salary_matrix, salary_universe);

fprintf('\nВысокая зп\n');
[W_high, lambda_high] = func(high_salary_matrix, salary_universe);

figure;
plot(salary_universe, W_low, 'LineWidth', 2, 'DisplayName', 'Низкая зп', 'MarkerSize', 8);
hold on;
plot(salary_universe, W_medium, 'LineWidth', 2, 'DisplayName', 'Средняя зп', 'MarkerSize', 8);
plot(salary_universe, W_high, 'LineWidth', 2, 'DisplayName', 'Высокая зп', 'MarkerSize', 8);
hold off;

grid on;
xlabel('Зарплата (тыс. р.)');
ylabel('Степень принадлежности');
legend('show', 'Location', 'best');
xlim([0, 240]);

function [W, lambda_max] = func(A, salary_universe)
    [V, D] = eig(A);
    lambda_max = max(diag(D));

    [~, idx] = max(diag(D));
    Wm = abs(V(:, idx));
    W = Wm / max(Wm);
    
    fprintf('λ_max = %.4f\n', lambda_max);
    fprintf('Степени принадлежности:\n');
    for i = 1:length(W)
        fprintf('  %2d зп: %.3f\n', salary_universe(i), W(i));
    end
end