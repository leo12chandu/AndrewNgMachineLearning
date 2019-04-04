function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



%hThetaX = sigmoid(X * theta);
%firstTerm =  log(hThetaX') * (-1 * y);
%secondTerm = log(1 - hThetaX') * (1 - y);
%thirdTerm = (lambda / 2 * m) * sum(theta(2:size(theta)));


hThetaX = sigmoid(X * theta);
firstTerm =  (-1 * y') * log(hThetaX);
secondTerm = (1 - y') * log(1 - hThetaX);
thirdTerm = (lambda / (2 * m)) * sumsq(theta(2:size(theta)));

J = ((1 / m) * (firstTerm - secondTerm)) + thirdTerm;


gradThirdTerm = (lambda / m) * theta(2:size(theta));
gradThirdTerm = [zeros(1,1); gradThirdTerm];

grad = (1 / m) * X' * (hThetaX - y) + gradThirdTerm;




% =============================================================

end
