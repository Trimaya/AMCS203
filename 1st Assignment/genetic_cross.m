function [genotypes, phenotypes] = genetic_cross(parent1_genotypes, parent2_genotypes)
    % parent1_genotypes and parent2_genotypes should be strings representing genotypes
    
    % Determine number of genes (length of genotypes)
    num_genes = length(parent1_genotypes);
    
    % Initialize arrays to store genotypes and phenotypes
    genotypes = cell(2^num_genes, 1);
    phenotypes = cell(2^num_genes, 1);
    
    % Generate all possible genotypes and corresponding phenotypes
    for i = 1:2^num_genes
        % Convert the index i to binary representation
        bin_rep = dec2bin(i-1, num_genes); % subtract 1 to start from 0
        
        % Create genotype strings for each individual
        offspring_genotype = '';
        for j = 1:num_genes
            if bin_rep(j) == '0'
                offspring_genotype = strcat(offspring_genotype, parent1_genotypes(j));
            else
                offspring_genotype = strcat(offspring_genotype, parent2_genotypes(j));
            end
        end
        
        % Store genotype
        genotypes{i} = offspring_genotype;
        
        % Determine phenotype (assuming complete dominance)
        phenotype = '';
        for j = 1:num_genes
            if offspring_genotype(j) == 'A'
                phenotype = strcat(phenotype, 'dominant ');
            else
                phenotype = strcat(phenotype, 'recessive ');
            end
        end
        
        % Store phenotype
        phenotypes{i} = phenotype;
    end
end
