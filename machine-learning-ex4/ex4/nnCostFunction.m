function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


%Part 1:

X = [ones(m, 1) X];
%size(Theta1)
%size(Theta2)
%size(X)

z_2 = X * Theta1';
%z_2 = Theta1 * X';
a_2 = sigmoid(z_2);

%size(a_2)

a_2 = [ones(size(a_2, 1), 1) a_2];
z_3 = a_2 * Theta2';
%a_2 = [ones(1, size(a_2, 2)); a_2];
%z_3 = Theta2 * a_2;
a_3 = sigmoid(z_3);


%Convert y 1 column to 10 columns with binary values where the index that matches the y number 1.
identity_matrix = eye(max(y));
y = identity_matrix(y,:);

%size(a_3)
%size(y)

first_term = (-1 * y) .* log(a_3);
second_term = (1 - y) .* log(1 - a_3);

Theta1_unrolled = Theta1(:, 2:size(Theta1, 2))(:);
Theta2_unrolled = Theta2(:, 2:size(Theta2, 2))(:);
third_term = (lambda / (2 * m)) * (sumsq(Theta1_unrolled) + sumsq(Theta2_unrolled));

J = sum(sum((1 / m) * (first_term - second_term))) + third_term;


%size(first_term)
%size(second_term)


%size(J)


% -------------------------------------------------------------
%Part 2:
delta_all_1 = zeros(size(Theta1));
delta_all_2 = zeros(size(Theta2));

for t = 1:m
  
  %Step 1:- forward propagation.

  %Get first training element
  a_1 = X(t,:);
  
  %calculate z_2 and a_2
  %z_2 = [ones(1, 1) a_1] * Theta1';
  %z_2 = [1 ; a_1] * Theta1';
  z_2 = a_1 * Theta1';
  a_2 = sigmoid(z_2);
  
  %Add bias unit.
  a_2 = [ones(size(a_2, 1), 1) a_2];
  
  %calculate z_3 and a_3
  z_3 = a_2 * Theta2';
  a_3 = sigmoid(z_3);
  
  %size(a_3)
  %size(y(t,:))
  
  
  
  %Step 2:- back propagation
  
  %Delta for last layer.
  delta_3 = a_3 - y(t, :);
  
  %size(a_1)
  %size(Theta2)
  %size(delta_3)
  %size(z_2)
  
  
  %Step3
  
  %Delta for hidden layer
  delta_2 = (delta_3 * Theta2(:,2:end)) .* sigmoidGradient(z_2);
  
  %size(delta_2)
  %size(a_1)
  %size(delta_3)
  %size(a_2)
  
  %Step 4
  delta_all_1 = delta_all_1 + delta_2' * a_1;
  delta_all_2 = delta_all_2 + delta_3' * a_2;
  
endfor

%Step 5
Theta1_grad = ((1 / m) * delta_all_1) + ((lambda / m) * [zeros(size(Theta1, 1),1) Theta1(:, 2:end)]);
Theta2_grad = ((1 / m) * delta_all_2) + ((lambda / m) * [zeros(size(Theta2, 1),1) Theta2(:, 2:end)]);


% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
