function plot_results(num_samples, estimated_pi)
    errors = estimated_pi - pi;
    
    sample_variance = calculate_variance(errors);
    error_bars = sqrt(sample_variance) * ones(size(errors));
    
    figure;
    hold on;
    scatter(num_samples, errors, 'b.');
    
    % Plot vertical lines from the x-axis to each point
    for i = 1:length(num_samples)
        line([num_samples(i), num_samples(i)], [0, errors(i)], 'Color', 'b', 'LineStyle', '-');
    end
    
    errorbar(num_samples, errors, error_bars, 'b', 'LineStyle', 'none');
    
    xlabel('Number of Samples');
    ylabel('Error');
    title('Pi Estimation Error');
    legend('Monte Carlo');
    grid on;
    hold off;
end