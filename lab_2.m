salary_universe = [0 30 60 90 120 150 180 210 240];
%gaus 58 240
credit_universe = [5000 8000 10000 15000 20000 30000 45000 50000 80000];

credit_history_universe = [0 20 40 60 80 100];

law_salary_matrix = [
    1	2	4	6	8	8	9	9	9;
    1/2	1	3	5	7	8	9	9	9;
    1/4	1/3	1	2	5	7	8	9	9;
    1/6	1/5	1/2	1	2	4	7	8	9;
    1/8	1/7	1/5	1/2	1	2	4	7	8;
    1/8	1/8	1/7	1/4	1/2	1	3	5	7;
    1/9	1/9	1/8	1/7	1/4	1/3	1	3	5;
    1/9	1/9	1/9	1/8	1/7	1/5	1/3	1	3;
    1/9	1/9	1/9	1/9	1/8	1/7	1/5	1/3	1
];


medium_salary_matrix = [
    1	1/2	1/4	1/7	1/7	1/5	1/3	2	3;
    2	1	1/2	1/4	1/4	1/4	1/2	2	3;
    4	2	1	1/3	1/3	1/2	2	3	4;
    7	4	3	1	1/2	2	3	5	7;
    7	4	3	2	1	1/2	2	1/4	1/6;
    5	4	2	1/2	2	1	2	3	4;
    3	2	1/2	1/3	1/2	1/2	1	3	2;
    1/2	1/2	1/3	1/5	1/4	1/3	1/3	1	1/2;
    1/3	1/3	1/4	1/7	1/6	1/4	1/2	1/2	1
];


high_salary_matrix = [
    1	1/3	1/4	1/6	1/8	1/9	1/9	1/9	1/9;
    3	1	1/2	1/4	1/7	1/8	1/9	1/9	1/9;
    4	2	1	1/2	1/5	1/6	1/8	1/9	1/9;
    6	4	2	1	1/3	1/5	1/7	1/9	1/9;
    8	7	5	3	1	1/2	1/4	1/6	1/7;
    9	8	6	5	2	1	1/2	1/4	1/5;
    9	9	8	7	4	2	1	1/2	1/3;
    9	9	9	9	6	4	2	1	1/2;
    9	9	9	9	7	5	3	2	1
];

small_credit_matrix = [
    1	2	3	5	6	7	8	9	9;
    1/2	1	2	3	5	7	8	9	9;
    1/3	1/2	1	2	4	6	7	8	9;
    1/5	1/3	1/2	1	2	5	6	7	9;
    1/6	1/5	1/4	1/2	1	2	6	7	9;
    1/7	1/7	1/6	1/5	1/2	1	3	5	8;
    1/8	1/8	1/7	1/6	1/6	1/3	1	2	7;
    1/9	1/9	1/8	1/7	1/7	1/5	1/2	1	5;
    1/9	1/9	1/9	1/9	1/9	1/8	1/7	1/5	1
];

medium_credit_matrix = [
    1	1/2	1/4	1/6	1/6	1/4	1/2	2	4;
    2	1	1/3	1/5	1/5	1/3	1/2	2	4;
    4	3	1	1/3	1/4	1/3	1/3	2	3;
    6	5	3	1	1/2	1/3	1/2	3	5;
    6	5	4	2	1	1/2	1/2	2	4;
    4	3	3	3	2	1	1/2	4	6;
    2	2	3	2	2	2	1	6	1/7;
    1/2	1/2	1/2	1/3	1/2	1/4	1/6	1	1/8;
    1/4	1/4	1/3	1/5	1/4	1/6	1/7	1/8	1
];

big_credit_matrix = [
    1	1/2	1/3	1/5	1/7	1/8	1/9	1/9	1/9;
    2	1	1/2	1/3	1/4	1/7	1/8	1/9	1/9;
    3	2	1	1/3	1/4	1/5	1/8	1/9	1/9;
    5	3	3	1	1/2	1/4	1/6	1/8	1/9;
    7	4	4	2	1	1/3	1/5	1/7	1/9;
    8	7	5	4	3	1	1/3	1/4	1/9;
    9	8	8	6	5	3	1	1/2	1/5;
    9	9	9	8	7	4	2	1	1/4;
    9	9	9	9	9	9	5	4	1
];

bad_credit_history_matrix = [
    1	3	5	8	9	9;
    1/3	1	3	5	8	9;
    1/5	1/3	1	3	5	8;
    1/8	1/5	1/3	1	4	6;
    1/9	1/8	1/5	1/4	1	4;
    1/9	1/9	1/8	1/6	1/4	1
];

good_credit_history_matrix = [
    1	1/6	1/8	1/6	1/4	1/2;
    6	1	1/2	1/3	1/2	1;
    8	2	1	2	1	2;
    6	3	2	1	2	3;
    4	2	1	1/2	1	2;
    2	1	1/2	1/3	1/2	1
];

perfect_credit_history_matrix = [
    1	1/2	1/4	1/7	1/8	1/9;
    2	1	1/3	1/5	1/8	1/9;
    4	3	1	1/3	1/5	1/8;
    7	5	3	1	1/3	1/8;
    8	8	5	3	1	1/7;
    9	9	8	8	7	1   
];

%CREDIT
[W_small_credit, lambda_small_credit] = func(small_credit_matrix, credit_universe);
[W_medium_credit, lambda_medium_credit] = func(medium_credit_matrix, credit_universe);
[W_big_credit, lambda_big_credit] = func(big_credit_matrix, credit_universe);
figure;
hold on
plot(credit_universe, W_small_credit, 'LineWidth', 2, 'DisplayName', 'маленький размер кредита', 'MarkerSize', 8);
plot(credit_universe, W_medium_credit,'LineWidth', 2, 'DisplayName', 'средний размер кредита', 'MarkerSize', 8);
plot(credit_universe, W_big_credit, 'LineWidth', 2, 'DisplayName', 'большой размер кредита', 'MarkerSize', 8);
hold off;
grid on;
xlabel('Размер кредита (тыс. р.)');
ylabel('Степень принадлежности');
legend('show', 'Location', 'best');
xlim([5000, 80000]);

%SALARY
[W_medium, lambda_medium] = func(medium_salary_matrix, salary_universe);
[W_law, lambda_law] = func(law_salary_matrix, salary_universe);
[W_high, lambda_high] = func(high_salary_matrix, salary_universe);
figure;
hold on
plot(salary_universe, W_law, 'LineWidth', 2, 'DisplayName', 'низкая зп', 'MarkerSize', 8);
plot(salary_universe, W_medium, 'LineWidth', 2, 'DisplayName', 'средняя зп', 'MarkerSize', 8);
plot(salary_universe, W_high, 'LineWidth', 2, 'DisplayName', 'высокая зп', 'MarkerSize', 8);
hold off;
grid on;
xlabel('Зарплата (тыс. р.)');
ylabel('Степень принадлежности');
legend('show', 'Location', 'best');
xlim([0, 240]);

%CREDIT HISTORY
[W_bad_credit_history, lambda_bad_credit_history] = func(bad_credit_history_matrix, credit_history_universe);
disp(W_bad_credit_history);
[W_good_credit_history, lambda_good_credit_history] = func(good_credit_history_matrix, credit_history_universe);
[W_perfect_credit_history, lambda_perfect_credit_history] = func(perfect_credit_history_matrix, credit_history_universe);
figure;
hold on
plot(credit_history_universe, W_bad_credit_history, 'LineWidth', 2, 'DisplayName', 'плохая кредитная история', 'MarkerSize', 8);
plot(credit_history_universe, W_good_credit_history,'LineWidth', 2, 'DisplayName', 'хорошая кредитная история', 'MarkerSize', 8);
plot(credit_history_universe, W_perfect_credit_history, 'LineWidth', 2, 'DisplayName', 'отличная кредитная история', 'MarkerSize', 8);
hold off;
grid on;
xlabel('Балл кредитной истории');
ylabel('Степень принадлежности');
legend('show', 'Location', 'best');
xlim([0, 100]);

function [W, lambda_max] = func(A, salary_universe)
    [V, D] = eig(A);
    lambda_max = max(diag(D));

    [~, idx] = max(diag(D));
    Wm = abs(V(:, idx));
    W = Wm / max(Wm);

    % fprintf('λ_max = %.4f\n', lambda_max);
    % fprintf('Степени принадлежности:\n');
    % for i = 1:length(W)
    %     fprintf('  %2d зп: %.3f\n', salary_universe(i), W(i));
    % end
end