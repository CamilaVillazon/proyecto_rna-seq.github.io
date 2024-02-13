#Normalize data
dge <- DGEList(
  counts = assay(rse_gene_SRP110290, "counts"),
  genes = rowData(rse_gene_SRP110290)
)
dge <- calcNormFactors(dge)
