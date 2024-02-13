# Load required pakages
library("recount3")
library("edgeR")
library("ggplot2")
library("limma")
library("pheatmap")
library("RColorBrewer")

# Obtain data from de study SRP166108
rse_gene_SRP110290 <- recount3::create_rse_manual(
  project = "SRP110290",
  project_home = "data_sources/sra",
  organism = "mouse",
  annotation = "gencode_v23",
  type = "gene"
)

# Observe data
rse_gene_SRP110290

