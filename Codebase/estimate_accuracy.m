function [mean_estimate, variance] = estimate_accuracy(num_of_num_samples, lower_bound, upper_bound, estimation_method)
    num_samples = linspace(lower_bound, upper_bound, num_of_num_samples);
    estimates = zeros(size(num_samples));

    for idx = 1:length(num_samples)
        N = round(num_samples(idx));
        estimates(idx) = estimation_method(N);
    end

    mean_estimate = mean(estimates);
    variance = calculate_variance(estimates);
end