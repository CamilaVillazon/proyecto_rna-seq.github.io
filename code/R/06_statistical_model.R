#continue with the statistical model using the
#variables: age, cell_type and treatment

mod <- model.matrix(~ age + sra_attribute.cell_type + sra_attribute.treatment +assigned_gene_prop,
                    data = colData(rse_gene_SRP110290)
)

colnames(mod)


# Differential expression analyses
vGene <- voom(dge, mod, plot = TRUE)

# Adjust to attribute age by coefficient 2
eb_results <- eBayes(lmFit(vGene))

de_results <- topTable(
  eb_results,
  coef = 2,
  number = nrow(rse_gene_SRP110290),
  sort.by = "none"
)

dim(de_results)

# Genes differentialy expressed between old and young.
plotMA(eb_results, coef = 2)
volcanoplot(eb_results, coef = 2, highlight = 3, names = de_results$gene_name)

#Most differentialy expressed genes:
de_results[de_results$gene_name %in% c("Gm2843", "Mid1-ps1", "Mid1"), ]

