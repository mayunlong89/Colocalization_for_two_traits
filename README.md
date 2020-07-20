# Colocalization_for_two_traits

1) This pipeline is used for performing colocalization analysis for two complex diseases based on GWAS summary statistics.

2) The summary is a vector giving the number of SNPs analysed, and the posterior probabilities of H0 (no causal variant), H1 (causal variant for trait 1 only), H2 (causal variant for trait 2 only), H3 (two distinct causal variants) and H4 (one common causal variant):
H0: No association with either trait;
H1: Association with trait 1, not with trait 2;
H2: Association with trait 2, not with trait 1;
H3: Association with trait 1 and trait 2, two independent SNPs;
H4: Association with trait 1 and trait 2, one shared SNP.

3) The result is an annotated version of the input data containing log Approximate Bayes Factors and intermediate calculations, and the posterior probability SNP.PP.H4 of the SNP being causal for the shared signal.  A large posterior probability for hypothesis H3, PP3 indicates support for two independent causal SNPs associated with each trait. In contrast, if PP.H4 is large, the data support a single variant affecting both traits. 
