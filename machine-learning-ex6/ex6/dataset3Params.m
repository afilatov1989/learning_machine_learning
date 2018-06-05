function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

c_vec = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30];
error = intmax('int64');

for i = 1:length(c_vec)
    for j = 1:length(sigma_vec)
        model= svmTrain(X, y, c_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j)));
        predictions = svmPredict(model, Xval);
        cur_error = mean(double(predictions ~= yval));
        if cur_error < error
           error = cur_error;
           C = c_vec(i);
           sigma = sigma_vec(j);
        end
    end
end

% =========================================================================

end
