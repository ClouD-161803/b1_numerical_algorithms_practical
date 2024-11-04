% Compare Pi Estimation Methods (Bisection, Newton-Raphson, and Ramanujan only)
clc; clear; close all;

% Parameters
num_of_iterations = 3; % Number of iterations for each method
lower_bound = 1;
upper_bound = 3;
iterations = linspace(lower_bound, upper_bound, num_of_iterations);

% Methods (excluding Monte Carlo)
methods = {@bisection, @newton_raphson, @ramanujan};
method_names = {'Bisection', 'Newton Raphson', 'Ramanujan'};
errors = zeros(num_of_iterations, length(methods));

% Calculate errors for each method
for m = 1:length(methods)
    estimation_method = methods{m};
    for idx = 1:num_of_iterations
        N = round(iterations(idx)); % Number of iterations
        pi_est = estimation_method(N); % Estimate of pi for this method
        errors(idx, m) = abs(pi_est - pi); % Absolute error
    end
end

% Plot results
figure;
hold on;

% Define line styles, colors, and markers for the three methods
line_styles = {'--', '-.', ':'}; % Different line styles for each method
colors = {'r', 'g', 'm'}; % Different colors for each method
markers = {'s', 'd', '^'}; % Different markers for each method

% Plot error for each method with styling
for m = 1:length(methods)
    plot(iterations, ...
         errors(:, m), ...
         'LineStyle', line_styles{m}, ...
         'Color', colors{m}, ...
         'Marker', markers{m}, ...
         'MarkerSize', 6, ...
         'LineWidth', 1.5, ...
         'DisplayName', method_names{m});
end

% Add labels and title
xlabel('Number of Iterations', 'FontSize', 12);
ylabel('Error', 'FontSize', 12);
title('Comparison of Pi Estimation Methods (Bisection, Newton Raphson, Ramanujan)', 'FontSize', 14);
legend('show', 'Location', 'northeast');
grid on;

% Remove log scale from x-axis
set(gca, 'YScale', 'log'); % Keep only the y-axis in log scale

% Set limits for x-axis and y-axis
xlim([lower_bound, upper_bound]);
ylim([min(errors(errors > 0)) * 0.9, max(errors(:)) * 1.1]); % Avoid zeros in the y-axis

hold off;