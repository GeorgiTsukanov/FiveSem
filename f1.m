function f1()
    ranges = [160, 165, 170, 175, 180, 185, 190, 195];
    ranges_label = {'160-165', '165-170', '170-175', '175-180', '180-185', '185-190', '190-195', '195-200'};
    
    low_ratings = [
        1 1 1 0 0 0 0 0;
        1 1 1 0 0 0 0 0;
        1 0 0 0 0 0 0 0;
        1 1 1 0 0 0 0 0;
        1 1 0 0 0 0 0 0
    ];
    
    medium_ratings = [
        0 0 1 1 1 0 0 0;
        0 0 1 1 0 0 0 0;
        0 1 1 1 1 1 0 0;
        0 0 0 1 1 1 0 0;
        0 1 1 1 0 0 0 0
    ];
    
    high_ratings = [
        0 0 0 0 0 1 1 1;
        0 0 0 0 1 1 1 1;
        0 0 0 0 0 1 1 1;
        0 0 0 0 0 0 1 1;
        0 0 0 1 1 1 1 1
    ];
    
    K = size(low_ratings, 1);
    
    mu_low = sum(low_ratings, 1) / K;
    mu_medium = sum(medium_ratings, 1) / K;
    mu_high = sum(high_ratings, 1) / K;
    
    figure;
    plot(ranges, mu_low, 'LineWidth', 2, 'MarkerSize', 6);
    hold on;
    plot(ranges, mu_medium, 'LineWidth', 2, 'MarkerSize', 6);
    plot(ranges, mu_high, 'LineWidth', 2, 'MarkerSize', 6);
    hold off;
    
    xlabel('Рост, см');
    ylabel('Степень принадлежности');
    title('Функции принадлежности для лингвистической оценки роста');
    legend('Низкий', 'Средний', 'Высокий', 'Location', 'best');
    grid on;
    
    fprintf('Функции принадлежности:\n');
    fprintf('Рост | Низкий | Средний | Высокий\n');
    for i = 1:length(ranges)
        fprintf('%s| %f | %f | %f\n', ranges_label{i}, mu_low(i), mu_medium(i), mu_high(i));
    end
end