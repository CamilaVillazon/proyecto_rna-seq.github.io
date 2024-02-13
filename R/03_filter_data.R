#Proportion of reads assigned to genes
rse_gene_SRP110290$assigned_gene_prop <- rse_gene_SRP110290$recount_qc.gene_fc_count_all.assigned / rse_gene_SRP110290$recount_qc.gene_fc_count_all.total
summary(rse_gene_SRP110290$assigned_gene_prop)


# Search difference between age groups
with(colData(rse_gene_SRP110290), tapply(assigned_gene_prop, age, summary))

#Discard samples with low quality and low expression levels
# Save unchanged object
rse_gene_SRP110290_unfiltered <- rse_gene_SRP110290

hist(rse_gene_SRP110290$assigned_gene_prop)

table(rse_gene_SRP110290$assigned_gene_prop < 0.2)

#remove low quality
rse_gene_SRP110290 <- rse_gene_SRP110290[, rse_gene_SRP110290$assigned_gene_prop > 0.2]

#Remove low expression
gene_means <- rowMeans(assay(rse_gene_SRP110290, "counts"))
summary(gene_means)
rse_gene_SRP110290 <- rse_gene_SRP110290[gene_means > 0.04, ]
dim(rse_gene_SRP110290)

#percentage of genes retained
round(nrow(rse_gene_SRP110290) / nrow(rse_gene_SRP110290_unfiltered) * 100, 2)
