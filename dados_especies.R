dados_totais <- read.csv("dados_totais_com_zeros.csv", header = TRUE, sep = ",")
species_data <- dados_totais[,-1]
dados_matriz <- as.matrix(species_data)
rownames(species_data) <- dados_totais$Especie
richness_m <- specnumber(dados_matriz)
shannon_m <- diversity(dados_matriz, index = "shannon")
simpson_m <- diversity(dados_matriz, index = "simpson")
evenness_m <- shannon_m / log(richness_m)
berger_parker_m <- apply(dados_matriz, 1, function(x) max(x)/sum(x))
diversity_indices_m <- data.frame(
  Pontos = rownames(species_data),
  Righness = richness_m,
  Shannon = round(shannon_m, 3),
  Simpson = round(simpson_m, 3),
  Evenness = round(evenness_m, 3),
  Berger_Parker = round(berger_parker_m, 3)
)
write.csv(diversity_indices_m, "indices_de_diversidade_especies.csv")
print(diversity_indices_m)
