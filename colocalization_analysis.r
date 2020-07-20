#Rscript

#Author: Yunlong Ma
#E-mail: glb-biotech@zju.edu.cn
#@2019-12-6 first version
#@2020-7-16 second version
#@2020-7-20 third version

#This code is used for performing Colocalization analysis for two complex diseases based on GWAS summary statistics

#1 note: it is important to set the mirror for downloading
#@ RStudio > tool > global option > packages > change to China (Beijing) [https] - TUNA Team, Tsinghua University

setwd("C:\\Users\\MYL\\Desktop\\")
setwd("C:/Users\\Administrator\\Desktop\\")

#2 location for R-3.5.1
(.libPaths())

#3 install packages

#install "coloc" with its dependencies
options(repos='https://cran.rstudio.com/')
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("snpStats")
if (!requireNamespace("DEoptimR", quietly = TRUE))install.packages("DEoptimR")
if (!requireNamespace("pcaPP", quietly = TRUE))install.packages("pcaPP")
if (!requireNamespace("leaps", quietly = TRUE))install.packages("leaps")
if (!requireNamespace("robustbase", quietly = TRUE))install.packages("robustbase")
if (!requireNamespace("coloc", quietly = TRUE))install.packages("coloc")

#install "tidyverse" with its dependencies
if (!requireNamespace("ggplot2", quietly = TRUE))install.packages("ggplot2")
if (!requireNamespace("dbplyr", quietly = TRUE))install.packages("dbplyr")
if (!requireNamespace("broom", quietly = TRUE))install.packages("broom")
if (!requireNamespace("modelr", quietly = TRUE))install.packages("modelr")
if (!requireNamespace("tidyverse", quietly = TRUE))install.packages("tidyverse")

#4 load packages
library(coloc)
library(tidyverse)


#5 read datasets
B2 <- read_delim("B2_COVID_I.cojo",delim=" ")
hypertension <- read_delim("hypertension.raw",delim=" ")  


#6 calculate some estimates
s_meta <- (1610+3199)/(3815+897488+3199)
s_hypertension <- 119731/462933

B2 <- B2 %>% mutate(varbeta=se**2)
hypertension <- hypertension %>% mutate(varbeta=se**2)


#7 perform Bayesian colocalization analysis
my.res <- coloc.abf(
  dataset1=list(s=s_meta, varbeta=pull(B2,varbeta), beta=pull(B2,b),type="cc",snp=pull(B2,SNP)),
  dataset2=list(s=s_hypertension, varbeta=pull(hypertension,varbeta), beta=pull(hypertension,b),snp=pull(hypertension,SNP),type="cc"))



#End

