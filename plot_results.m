function plot_results(num_samples, estimated_pi)

    figure;

    plot(num_samples, estimated_pi, 'b-o');
    hold on;
    plot(num_samples, pi * ones(size(num_samples)), 'r--');

    xlabel('Number of Samples');
    ylabel('Estimated Pi');
    title('Monte Carlo Pi Estimation');
    legend('Estimated Pi', 'Actual Pi');
    grid on;

end