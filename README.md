# Linear-Regression-for-Cost-Estimation
Population &amp; Profit
%% Machine Learning - Exercise 1: Linear Regression
%  This file contains code that helps you get started on the
%  linear regression exercise. You will need to complete the following functions
%  in this exericse:

%     gradientDescent.m
%     computeCost.m
%
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%% ======================= Part 1: Plotting =======================
load ex1data1.mat
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
plot(X, y,'+','Linewidth',2);

%% =================== Part 2: Cost and Gradient descent ===================
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01; % 0.01

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
 J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\n Cost computed = %f\n', J);
% fprintf('Expected cost value (approx) 32.07\n');

% further testing of the cost function
[J] = computeCost(X, y, [-1 ; 2]);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 54.24\n');

%% run gradient descent
[theta J] = gradientDescent(X, y, theta, alpha, iterations);

% %%%% Using inbuilt function of MATLAB
%  para0=[1 -2];
% [para1] = fminsearch('lossfun',para0,[],X,y);
% [para2] = fminunc('lossfun',para0,[],X,y);

%%%%%%%
% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);   
