% Number of trials to average over
num_trials = 1000000;

% Measure time per Monte Carlo sample
tic;
for i = 1:num_trials
    x = rand; y = rand; % Generate random sample
    in_circle = (x^2 + y^2 <= 1); % Check if in unit circle
end
time_mc = toc / num_trials;

% Measure time per Bisection iteration
a = 3; b = 4; % Sample interval for bisection
f = @(x) cos(x/2); % Function to find root for pi
tic;
for i = 1:num_trials
    c = (a + b) / 2; % Midpoint
    if f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
end
time_bi = toc / num_trials;

% Estimate number of Monte Carlo samples for computational parity
N_equiv = round(time_bi / time_mc);
fprintf('Approximate number of Monte Carlo samples for parity: %d\n', N_equiv);