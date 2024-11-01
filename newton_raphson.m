function pi_est = newton_raphson(N)
    % Newton-Raphson method to estimate pi with f(x) = cos(x/2)
    % and f'(x) = -sin(x/2)/2
    
    x = 3.5;
    
    for iter = 1:N
        f_x = cos(x/2);
        f_prime_x = -sin(x/2) / 2;
        
        x = x - f_x / f_prime_x;
    end
    
    pi_est = x;
end