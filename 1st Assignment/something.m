
% Example usage:
% Calculate the probability of exactly 2 successes in 30 trials with success probability 0.5
binomial_distribution_calculator(30, 0.984375, 2);

% Calculate the probability of 0, 1, 2, and 3 successes in 30 trials with success probability 0.5
binomial_distribution_calculator(30, 0.984375, [0, 1, 2, 3]);

% Calculate the probability of at least 2 successes in 30 trials with success probability 0.5
binomial_probability_ge_k(30, 0.984375, 2);


function binomial_distribution_calculator(n, p, k)
    % binomial_distribution_calculator - Calculate binomial probabilities
    %
    % Syntax: binomial_distribution_calculator(n, p, k)
    %
    % Inputs:
    %   n - Number of trials
    %   p - Probability of success in a single trial
    %   k - Number of successes (can be a single value or an array of values)
    %
    % Example:
    %   binomial_distribution_calculator(30, 0.5, 2)
    %   binomial_distribution_calculator(30, 0.5, [0, 1, 2, 3])
    
    % Ensure k is a row vector
    if iscolumn(k)
        k = k';
    end
    
    % Calculate binomial probabilities
    binom_prob = binopdf(k, n, p);
    
    % Display results for exact k
    for i = 1:length(k)
        fprintf('P(X = %d) = %.4f\n', k(i), binom_prob(i));
    end
end

function P_ge_k = binomial_probability_ge_k(n, p, k)
    % binomial_probability_ge_k - Calculate P(X >= k) for a binomial distribution
    %
    % Syntax: P_ge_k = binomial_probability_ge_k(n, p, k)
    %
    % Inputs:
    %   n - Number of trials
    %   p - Probability of success in a single trial
    %   k - Minimum number of successes
    %
    % Outputs:
    %   P_ge_k - Probability of getting at least k successes
    
    % Calculate the cumulative distribution function for k-1
    P_less_than_k = binocdf(k-1, n, p);
    
    % Calculate the probability of at least k successes
    P_ge_k = 1 - P_less_than_k;
    
    % Display the result
    fprintf('P(X >= %d) = %.4f\n', k, P_ge_k);
end
