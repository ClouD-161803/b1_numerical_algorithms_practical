% Monte Carlo Pi Estimation

num_of_num_samples = 100;
lower_bound = 1000;
upper_bound = 1000000;
num_samples = linspace(lower_bound, upper_bound, num_of_num_samples);
estimated_pi = zeros(size(num_samples));

for idx = 1:length(num_samples)
    N = round(num_samples(idx));
    estimated_pi(idx) = montecarlo(N);
end

plot_results(num_samples, estimated_pi);