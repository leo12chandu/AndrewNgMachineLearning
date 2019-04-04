function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


posFunc = find(y == 1);
negFunc = find(y == 0);

% First way
plot(X(:,1)(posFunc), X(:,2)(posFunc), 'k+', X(:,1)(negFunc), X(:,2)(negFunc), 'ko')

%Second way
%plot(X(posFunc, 1), X(posFunc, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7)
%plot(X(negFunc, 1), X(negFunc, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)




% =========================================================================



hold off;

end
