function variance = calculate_variance(estimates)

    n = length(estimates);
    mean_estimate = mean(estimates);
    variance = sum((estimates - mean_estimate).^2) / (n - 1);
    
end