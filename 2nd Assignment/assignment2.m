% Example usage:
parent1_genotypes = 'Aa';
parent2_genotypes = 'aa';

[genotypes, phenotypes] = genetic_cross(parent1_genotypes, parent2_genotypes);

% Display the results
disp('Possible Genotypes:');
disp(genotypes);
disp('Corresponding Phenotypes:');
disp(phenotypes);
