**Autora**: Ileana Tossolini

En este proyecto se usaron datos propios y descargados de respositorios públicos (GSE61798), provenientes de análisis de secuenciación de pequeños ARNs (small RNA-seq) de Fragaria vesca (frutilla salvaje) en diferentes estadios. 
Las secuenciaron se alinearon contra loci identificados previamente como IRs (repeticiones invertidas derivadas de transposones) en nuestro grupo de trabajo. Los datos con los que se comienza a trabajar aquí fueron producidos con la herramienta ShortStack. 
El objetivo es analizar los IRs que producen small RNAs, en particular de 24 nucleótidos, en las diferentes condiciones. Y por último, utilizando distintas herramientas bioinformáticas, se busca cuáles IRs tienen expresión diferencial en dos estadios de maduración del fruto, y cuántos de ellos están cerca de genes en frutilla, pudiendo afectar su expresión y la topología de la cromatina.


# Preparación del entorno

Para que el código funcione adecuadamente necesitamos importar las diferentes bibliotecas que se usarán para diversos análisis:

```
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn
from seaborn import load_dataset
import scipy
from sklearn.cluster import AgglomerativeClustering
```

Los pasos que se realizan para el procesamiento de los datos son los siguientes:

**1.** Carga de los datos iniciales obtenidos mediante small RNA-seq procesados con [ShortStack](https://github.com/MikeAxtell/ShortStack)
**2.** Filtrado y limpieza de datos
**3.** Análisis de Clustering de expresión de small RNAs provenientes de IRs en F.vesca
**4.** Análisis de Expresión Diferencial, fuera de Colab, empleando el paquete [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) de R
**5.** Cálculo de la distancia de los IRs diferencialmente expresados a genes anotados en F.vesca empleando bedtools

**Resumen:**
Los pasos y su ejecución están detallados en un notebook de Jupyter: IT_ProyectoFinal_WBDS2023.ipynb 

Al inicio del procesamiento necesitamos realizar el filtrado y limpieza de datos para quedarnos con la información relevante. Al realizar análisis de clustering de las diferentes condiciones de expresión de small RNAs provenientes de IRs en F.vesca pudimos detectar la correlación entre las mismas, como un análisis exploratorio inicial.
Al final de todo el procesamiento logramos que los datos se volvieran más interesantes de explorar, al reducir las variables analizadas. Pudemos ver que hay IRs que tienen una alta correlación entre ambas condiciones de maduración del fruto analizadas, y otros que no. Estos elementos son muy interesantes de observar en detalle, junto con otros datos (no analizados aquí) para estudiar su rol en la adaptación y maduración de frutilla. 
