function estimated_pi = estimate_pi(num_of_num_samples, lower_bound, upper_bound, estimation_method)

    num_samples = linspace(lower_bound, upper_bound, num_of_num_samples);
    estimated_pi = zeros(size(num_samples));

    for idx = 1:length(num_samples)
        N = round(num_samples(idx));

        estimated_pi(idx) = estimation_method(N);
    end
end