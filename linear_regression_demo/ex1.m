load('ex1data1.mat.mat');
x = data(:, 1); 
y = data(:, 2);
m = length(y);

plot(x, y, 'rx', 'MarkerSize', 10); 
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');

x = [ones(m, 1), X]; 
theta = zeros(2, 1);

iterations = 1500;
alpha = 0.01;

J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0], Cost = %f\n', J);

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

hold on;
plot(X(:,2), X*theta, '-');
legend('Training data', 'Linear regression');
hold off;

predict1 = [1, 3.5] * theta;
fprintf('For population = 35,000, we predict a profit of %f\n', predict1 * 10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n', predict2 * 10000);
