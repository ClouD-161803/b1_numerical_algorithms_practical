% Pi Estimation
clc; clear; close all;

method = input( ...
    'Select the method (1: Monte Carlo, 2: Bisection, 3: Newton Raphson, 4: Ramanujan): ' ...
    );

if method == 1
    estimation_method = @montecarlo;
    num_of_num_samples = 1000;
    lower_bound = 1000;
    upper_bound = 1000000;
elseif method == 2
    estimation_method = @bisection;
    num_of_num_samples = 100;
    lower_bound = 1;
    upper_bound = 100;
elseif method == 3
    estimation_method = @newton_raphson_pi;
    num_of_num_samples = 100;
    lower_bound = 1;
    upper_bound = 100;
elseif method == 4
    estimation_method = @ramanujan_pi;
    num_of_num_samples = 100;
    lower_bound = 1;
    upper_bound = 100;
else
    error('Invalid selection. Please choose 1, 2, 3, or 4.');
end

estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, estimation_method);

[mean_estimate, variance] = estimate_accuracy(num_of_num_samples, lower_bound, upper_bound, estimation_method);

fprintf('Mean Estimate of Pi: %.6f\n', mean_estimate);
fprintf('Variance of Estimates: %.6f\n', variance);

plot_results(linspace(lower_bound, upper_bound, num_of_num_samples), estimated_pi);