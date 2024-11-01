% Monte Carlo Pi Estimation
clc; clear; close all;

num_of_num_samples = 10;
lower_bound = 1;
upper_bound = 10;

estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, @bisection);

plot_results(linspace(lower_bound, upper_bound, num_of_num_samples), estimated_pi);