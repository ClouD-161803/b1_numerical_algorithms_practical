function evaluate_montecarlo_accuracy(sample_counts)
    % Get the true value of pi with high precision
    true_pi = vpa(pi, 50);
    
    num_digits_correct = zeros(size(sample_counts));
    
    for i = 1:length(sample_counts)
        num_samples = sample_counts(i);
        pi_est = vpa(montecarlo(num_samples), 50);
        
        pi_est_str = char(pi_est);
        
        true_pi_str = char(true_pi);
        num_digits_correct(i) = count_matching_digits(pi_est_str, true_pi_str);
        
        fprintf('Samples: %d - Estimated Pi: %s - Digits Correct: %d\n', ...
            num_samples, pi_est_str, num_digits_correct(i));
    end
    
    figure;
    semilogx(sample_counts, num_digits_correct, 'b-o');
    xlabel('Number of Samples');
    ylabel('Number of Correct Digits');
    title('Monte Carlo Pi Estimation Accuracy');
    grid on;
end

function num_digits = count_matching_digits(est_str, true_str)
    num_digits = 0;
    for i = 1:min(length(est_str), length(true_str))
        if est_str(i) ~= true_str(i)
            break;
        end
        num_digits = num_digits + 1;
    end
end