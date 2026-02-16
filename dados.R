dados_totais <- read.csv("dadostotais_sem_zeros.csv", header = TRUE, sep = ",")

library(vegan)
library(ggplot2)
library(reshape2)
library(dplyr)
library(RColorBrewer)
library(pheatmap)
species_data <- dados_totais[,-1]
rownames(species_data) <- dados_totais$Nome_do_taxon_
species_data_t <- t(species_data)
richness <- specnumber(species_data_t)
shannon <- diversity(species_data_t, index = "shannon")
simpson <- diversity(species_data_t, index = "simpson")
evenness <- shannon / log(richness)
berger_parker <- apply(species_data_t, 1, function(x) max(x)/sum(x))
diversity_indices <- data.frame(
  site = rownames(species_data_t),
  Righness = richness,
  Shannon = round(shannon, 3),
  Simpson = round(simpson, 3),
  Evenness = round(evenness, 3),
  Berger_Parker = round(berger_parker, 3)
  )
print(diversity_indices)
