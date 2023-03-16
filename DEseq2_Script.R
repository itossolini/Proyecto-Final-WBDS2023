# Cargar los paquetes necesarios
library(DESeq2)
library(tidyverse)

# Importar los datos y crear un objeto DESeqDataSet
counts_table <- read.csv("/media/ileana/Datos win/IAL/Cursos/WBDS_Camp2023/Proyecto_Final/counts_white_red_siRNA.csv", row.names = 1)

colData <- data.frame(
  sample = c( "white_1", "white_2", "red_1", "red_2"),
  condition = c( "white", "white",  "red", "red" ), 
  row.names = "sample" )

colData$condition <- as.factor(colData$condition)

dds <- DESeqDataSetFromMatrix(countData = counts_table,
                              colData = colData,
                              design = ~ condition)

dds <- dds[rowSums(counts(dds)) >= 10,]

# Seteo a white como control
dds$condition <- relevel(dds$condition, ref = "white")

# Ajustar la matriz de conteos por tamaño de muestra y obtener los factores de normalización
dds <- DESeq(dds)

# Obtener los resultados
res <- results(dds)
summary(res)


# Guardar los resultados en un archivo
res_table <- as.data.frame(res[order(res$padj),] )
write.csv(as.data.frame(res[order(res$padj),] ), file="/media/ileana/Datos win/IAL/Cursos/WBDS_Camp2023/Proyecto_Final/resultados_DESeq2_siRNA.csv")

res_table_padj <- res_table %>% filter (padj <= 0.05)
res_table_padj <- res_table_padj %>% filter (log2FoldChange >= 1 | log2FoldChange <= -1)

write.csv(as.data.frame(res_table_padj[order(res_table_padj$padj),] ), file="/media/ileana/Datos win/IAL/Cursos/WBDS_Camp2023/Proyecto_Final/resultados_DESeq2_siRNA_padj.csv")


# Obtener las counts normalizadas y guardarlas en un archivo
normalized_counts <- counts(dds, normalized = TRUE)
write.csv(as.data.frame(normalized_counts), file="/media/ileana/Datos win/IAL/Cursos/WBDS_Camp2023/Proyecto_Final/counts_normalizados_siRNA.csv")

