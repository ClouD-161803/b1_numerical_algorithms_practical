function plot_results(num_samples, estimated_pi)
    errors = estimated_pi - pi;
    
    sample_variance = calculate_variance(errors);
    sigma = sqrt(sample_variance);
    
    figure;
    hold on;
    
    % Plot the estimated errors
    scatter(num_samples, errors, 'b.');
    
    % Plot the 1sigma region
    fill([num_samples, fliplr(num_samples)], ...
         [errors + sigma, fliplr(errors - sigma)], ...
         'b', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
    % Plot the 3sigma region
    fill([num_samples, fliplr(num_samples)], ...
         [errors + 3*sigma, fliplr(errors - 3*sigma)], ...
         'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
    
    % Plot vertical lines from the x-axis to each point
    for i = 1:length(num_samples)
        line([num_samples(i), num_samples(i)], [0, errors(i)], 'Color', 'b', 'LineStyle', '-');
    end
    
    xlabel('Number of Samples');
    ylabel('Error');
    legend('Monte Carlo error from \pi', '1\sigma Region');
    grid on;
    hold off;
end