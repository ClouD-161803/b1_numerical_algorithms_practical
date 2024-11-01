function plot_results(num_samples, estimated_pi)
    errors = estimated_pi - pi;
    
    figure;
    hold on;
    scatter(num_samples, errors, 'b.');
    
    % Plot vertical lines from the x-axis to each point
    for i = 1:length(num_samples)
        line([num_samples(i), num_samples(i)], [0, errors(i)], 'Color', 'b', 'LineStyle', '-');
    end
    
    xlabel('Number of Samples');
    ylabel('Error');
    title('Pi Estimation Error');
    legend('Error from Pi');
    grid on;
    hold off;
end