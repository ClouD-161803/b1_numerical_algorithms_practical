function pi_est = montecarlo(num_samples)

    % rng('default');

    x = rand(1, num_samples);
    y = rand(1, num_samples);

    count = 0;
    for i = 1:num_samples
        if x(i)^2 + y(i)^2 <= 1
            count = count + 1;
        end
    end

    pi_est = 4 * count / num_samples;

    % disp(['Estimated value of pi: ', num2str(pi_est)]);
end