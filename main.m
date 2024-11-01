% Monte Carlo Pi Estimation
clc; clear; close all;

num_of_num_samples = 1000;
lower_bound = 1000;
upper_bound = 1000000;

estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, @montecarlo);

plot_results(linspace(lower_bound, upper_bound, num_of_num_samples), estimated_pi);