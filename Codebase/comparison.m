% Compare Pi Estimation Methods (Bisection, Newton-Raphson, and Ramanujan)
clc; clear; close all;

num_of_iterations = 3;
lower_bound = 1;
upper_bound = 3;
iterations = linspace(lower_bound, upper_bound, num_of_iterations);

methods = {@bisection, @newton_raphson, @ramanujan};
method_names = {'Bisection', 'Newton Raphson', 'Ramanujan'};
errors = zeros(num_of_iterations, length(methods));

for m = 1:length(methods)
    estimation_method = methods{m};
    for idx = 1:num_of_iterations
        N = round(iterations(idx));
        pi_est = estimation_method(N);
        errors(idx, m) = abs(pi_est - pi);
    end
end

% Plot results
figure;
hold on;

line_styles = {'--', '-.', ':'};
colors = {'r', 'g', 'm'};
markers = {'s', 'd', '^'};

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

xticks(lower_bound:1:upper_bound);
xlabel('Number of Iterations', 'FontSize', 12);
ylabel('Error', 'FontSize', 12);
title('Comparison of Pi Estimation Methods', 'FontSize', 14);
legend('show', 'Location', 'northeast');
grid on;

set(gca, 'YScale', 'log');

xlim([lower_bound, upper_bound]);
ylim([min(errors(errors > 0)) * 0.9, max(errors(:)) * 1.1]); % avoid zeros

hold off;