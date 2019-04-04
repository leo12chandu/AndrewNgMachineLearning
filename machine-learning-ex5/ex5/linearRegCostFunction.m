function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%X
%X = [ones(size(X, 1), 1) X];
%size(X)
hThetaXFunc = (X * theta) - y;
first_term = hThetaXFunc' * hThetaXFunc;
second_term = sumsq(theta(2:end));

J = ((1 / (2 * m)) * first_term) + ((lambda / (2 * m)) * second_term);

grad_theta = [zeros(1, size(theta, 2)); theta(2:end)];


%size(X' * hThetaXFunc)
%size(grad_theta)

grad = ((1 / m) * (X' * hThetaXFunc)) + ((lambda / m) * grad_theta);








% =========================================================================

grad = grad(:);

end
