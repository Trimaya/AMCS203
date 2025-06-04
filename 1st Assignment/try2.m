% Define the probabilities for dominant phenotype for each trait
p_dominant_A = 3/4;
p_dominant_B = 3/4;
p_dominant_C = 3/4;

% Number of progeny
n_progeny = 30;

% Calculate the probability that at least one of the traits is dominant
p_at_least_one_dominant = 1 - (1 - p_dominant_A * p_dominant_B * p_dominant_C);

% Calculate the probability that at least two progeny have at least one dominant trait
prob = 0;
for k = 2:n_progeny
    prob = prob + nchoosek(n_progeny, k) * p_at_least_one_dominant^k * (1 - p_at_least_one_dominant)^(n_progeny - k);
end

% Display the result
fprintf('The probability that at least two of the progeny will display the dominant phenotype for at least one of the traits is %.4f\n', prob);
