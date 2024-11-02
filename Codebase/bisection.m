function pi_est = bisection(N)
    % Bisection method to estimate pi with f(x) = cos(x/2)
    lower_bound = 3;
    upper_bound = 4;
    
    for iter = 1:N
        mid_point = (lower_bound + upper_bound) / 2;
        if cos(mid_point/2) == 0
            break;
        elseif cos(lower_bound/2) * cos(mid_point/2) < 0
            upper_bound = mid_point;
        else
            lower_bound = mid_point;
        end
    end
    
    pi_est = (lower_bound + upper_bound) / 2;
end