% Pi Estimation
clc; clear; close all;

num_samples = 1000;
lower_bound = 1000;
upper_bound = 1000000;

estimated_pi = zeros(2, num_samples);
estimated_pi(1, :) = estimate_pi(num_samples, lower_bound, upper_bound, @montecarlo);
estimated_pi(2, :) = estimate_pi(num_samples, 1, 1000, @bisection) - pi;

% [mean_estimate, variance] = estimate_accuracy(num_samples, lower_bound, upper_bound, estimation_method);
% fprintf('Mean Estimate of Pi: %.6f\n', mean_estimate);
% fprintf('Variance of Estimates: %.6f\n', variance);

plot_results(linspace(lower_bound, upper_bound, num_samples), estimated_pi(1, :));

hold on;
plot(linspace(lower_bound, upper_bound, num_samples), estimated_pi(2, :), 'r-', 'LineWidth', 1.5, 'DisplayName', 'Bisection');

% Add labels and title
xlabel('Number of Samples / Iterations', 'FontSize', 12);
ylabel('Error', 'FontSize', 12);
title('Comparison of Pi Estimation Methods: Monte Carlo vs Bisection', 'FontSize', 14);
legend('show', 'Location', 'northeast');
grid on;

hold off;