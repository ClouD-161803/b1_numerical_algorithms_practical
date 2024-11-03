function pi_est = ramanujan(N)
    sum = 0;
    for k = 0:N-1
        numerator = factorial(4*k) * (1103 + 26390*k);
        denominator = (factorial(k)^4) * (396^(4*k));
        sum = sum + numerator / denominator;
    end
    pi_est = 1 / ((2 * sqrt(2) / 9801) * sum);
end