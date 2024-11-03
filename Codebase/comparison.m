% Compare Pi Estimation Methods
clc; clear; close all;

% Parameters
num_of_num_samples = 10;
lower_bound = 1;
upper_bound = 10;
samples = linspace(lower_bound, upper_bound, num_of_num_samples);

% Methods
methods = {@montecarlo, @bisection, @newton_raphson, @ramanujan};
method_names = {'Monte Carlo', 'Bisection', 'Newton Raphson', 'Ramanujan'};
errors = zeros(num_of_num_samples, length(methods));

% Calculate errors for each method
for m = 1:length(methods)
    estimation_method = methods{m};
    for idx = 1:num_of_num_samples
        
        N = round(samples(idx));
        if m == 1
            % Monte Carlo method
            num_samples = N * 10000;
            pi_est = estimation_method(num_samples);
        else
            % Other methods
            pi_est = estimation_method(N);
        end
        errors(idx, m) = pi_est - pi;
    end
end

% Plot results
figure;
hold on;
for m = 1:length(methods)
    loglog(linspace(lower_bound, upper_bound, num_of_num_samples) * 1000, errors(:, m), 'DisplayName', method_names{m});
end
xlabel('Number of Samples / Iterations');
ylabel('Error');
title('Comparison of Pi Estimation Methods');
legend('show');
grid on;
hold off;