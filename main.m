% Pi Estimation
clc; clear; close all;

% % Bisection Method
% num_of_num_samples = 10;
% lower_bound = 1;
% upper_bound = 10;
% estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, @bisection);

% Monte Carlo Method
num_of_num_samples = 1000;
lower_bound = 1000;
upper_bound = 1000000;
estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, @montecarlo);

[mean_estimate, variance] = estimate_accuracy(num_of_num_samples, lower_bound, upper_bound, @montecarlo);
fprintf('Mean Estimate of Pi: %.6f\n', mean_estimate);
fprintf('Variance of Estimates: %.6f\n', variance);

plot_results(linspace(lower_bound, upper_bound, num_of_num_samples), estimated_pi);