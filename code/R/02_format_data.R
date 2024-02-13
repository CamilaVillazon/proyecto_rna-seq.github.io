# Transform counts per nucleotide to
# counts per read.
assay(rse_gene_SRP110290, "counts") <-
  compute_read_counts(rse = rse_gene_SRP110290)

# Make the information easier to use
rse_gene_SRP110290 <- expand_sra_attributes(rse_gene_SRP110290)

colData(rse_gene_SRP110290)[, grepl('^sra_attribute', colnames(colData(rse_gene_SRP110290)))]

# Reformat data for statistical analysis

rse_gene_SRP110290$sra_attribute.mouse_age <- factor(rse_gene_SRP110290$sra_attribute.mouse_age)
rse_gene_SRP110290$sra_attribute.cell_type <- factor(rse_gene_SRP110290$sra_attribute.cell_type)
rse_gene_SRP110290$sra_attribute.treatment <- factor(rse_gene_SRP110290$sra_attribute.treatment)


# Summary of the categories
summary(as.data.frame(colData(rse_gene_SRP110290)[
  ,
  grepl("^sra_attribute.[age|cell_type|treatment]", colnames(colData(rse_gene_SRP110290)))
]))


# Make access to age parameter easier
rse_gene_SRP110290$age <- factor(rse_gene_SRP110290$sra_attribute.mouse_age)
