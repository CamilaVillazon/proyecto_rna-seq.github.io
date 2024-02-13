#Analyse differences in expression given
#different conditions

#per age group
ggplot(as.data.frame(colData(rse_gene_SRP110290)), aes(y = assigned_gene_prop, x = age)) +
  geom_boxplot() +
  theme_bw(base_size = 20) +
  ylab("Assigned Gene Prop") +
  xlab("Age Group")

#per cell type
ggplot(as.data.frame(colData(rse_gene_SRP110290)), aes(y = assigned_gene_prop, x = sra_attribute.cell_type)) +
  geom_boxplot() +
  theme_bw(base_size = 20) +
  ylab("Assigned Gene Prop") +
  xlab("Cell Type")

#per treatment
ggplot(as.data.frame(colData(rse_gene_SRP110290)), aes(y = assigned_gene_prop, x = sra_attribute.treatment)) +
  geom_boxplot() +
  theme_bw(base_size = 20) +
  ylab("Assigned Gene Prop") +
  xlab("Treatment")
