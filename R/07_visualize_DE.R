#extract the top 50 most differentialy expressed genes
exprs_heatmap <- vGene$E[rank(de_results$adj.P.Val) <= 50, ]

# data frame with friendlier names
df <- as.data.frame(colData(rse_gene_SRP110290)[, c("age", "sra_attribute.cell_type")])
colnames(df) <- c("AgeGroup", "CellType")

#heatmap
nombres_originales <- rownames(exprs_heatmap)

rownames(exprs_heatmap) <- rowRanges(rse_gene_SRP110290)$gene_name[
  match(rownames(exprs_heatmap), rowRanges(rse_gene_SRP110290)$gene_id)
]

pheatmap(
  exprs_heatmap,
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  show_rownames = TRUE,
  show_colnames = FALSE,
  annotation_col = df
)

