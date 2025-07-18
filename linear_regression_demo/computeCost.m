function J = computeCost(X, y, theta)
m = length(y);
predictions = X * theta;
sqrErrors = (predictions - y).^2;
J = 1/(2*m) * sum(sqrErrors);
end
