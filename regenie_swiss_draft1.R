# Load packages and data

if("librarian" %in% installed.packages()==FALSE) install.packages("librarian")
librarian::shelf(tidyverse)


status <- read.table("./data/raw/bc.txt", header = TRUE)
remove_qc <- read.table("./data/raw/fid_to_remove_breast.txt", header = TRUE)

# remove all ids from covariate and from status 

filter_status <- anti_join(status, remove_qc, by = "FID")
#197602 final number 

sum(is.na(filter_cov))
sum(is.na(filter_status))

#upload filtered datasets
write.table(filter_status, file = "./data/processed/filter_bc.txt", sep = "\t", row.names = FALSE, quote = FALSE)


system("regenie --step 2 --bgen ukb21007_c22_b0_v1.bgen --sample ukb21007_c22_b0_v1.sample --phenoFile filter_status_BC.txt --covarFile filter_cov_BC.txt --pred step1_chr22_pred.list --bsize 400 --out step2_chr22")
#step 2 ERROR: header of phenotype file must start with: FID IID.

