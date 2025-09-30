function f3()
    heights = [170, 175, 180, 185, 190, 195];

    
    % A = [
    %     1 1/2 1/4 1/6 1/8 1/9;
    %     2 1 1/3 1/5 1/7 1/8;
    %     4 3 1 1/4 1/4 1/5;
    %     6 5 4 1 1/3 1/3;
    %     8 7 4 3 1 1;
    %     9 8 5 3 1 1
    % ];
    % 
    % [V, D] = eig(A);
    % eigenvalues = diag(D);
    % [~, max_index] = max(eigenvalues); % индекс максимального собственного значения
    % W1 = V(:, max_index);

   A = [
       1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9;
       2 1 1/2 1/3 1/4 1/5 1/6 1/7 1/8;
       3 2 1 1/2 1/3 1/4 1/5 1/6 1/7;
       4 3 2 1 1/2 1/3 1/4 1/5 1/6;
       5 4 3 2 1 1/2 1/3 1/4 1/5;
       6 5 4 3 2 1 1/2 1/3 1/4;
       7 6 5 4 3 2 1 1/2 1/3;
       8 7 6 5 4 3 2 1 1/2;
       9 8 7 6 5 4 3 2 1
   ];

   n = size(A, 1);
   membership_degrees = zeros(1, n);
    
   for i = 1:n
       % Сумма элементов i-го столбца
       column_sum = sum(A(:, i));
        
       % Степень принадлежности по формуле
       membership_degrees(i) = 1 / column_sum;
   end
    
   membership_degrees = membership_degrees / max(membership_degrees);
    
   disp(A);
   disp(membership_degrees);
end