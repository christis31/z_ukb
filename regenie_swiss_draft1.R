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

#upload the R scipt for regenie 
#i did regenie mannually since it doesnt work and idk why

dx run app-swiss-army-knife \
-iimage="shukwong/rstudio_with_gwas_tools:fd324eb9d3d2117fc37a157b66fa371a53693442" \
-iin=
  project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)/ukb21007_c22_b0_v1.bgen \
-iin=
  project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)/ukb21007_c22_b0_v1.bgen.bgi \
-iin=
  project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)/ukb21007_c22_b0_v1.sample \
-iin=project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/filter_status_BC.txt \
-iin=project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/filter_cov_BC.txt \
-iin=project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/regenie_trial_22_bc.R \
-icmd="regenie_trial_22_bc.R" \
--instance-type mem1_ssd2_v2_x4 \
--destination project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor \
--cost-limit 1

#instead of mannually qc in local laptop you can use command --remove with a 2-column data of same ids in eah column to filter out the ids you dont want in the analysis

#inside the regenie was this code here

system("regenie --step 1 --bgen ukb21007_c22_b0_v1.bgen --sample ukb21007_c22_b0_v1.sample --phenoFile filter_status_BC.txt --covarFile filter_cov_BC.txt --bsize 1000 --out step1_chr22")

#step1 problem -> too many variants in the same analysis
#ERROR: it is not recommened to use more than 1000000 variants in step 1 (otherwise use '--force-step1'). For more information, use option '--help' or visit the website: https://rgcgithub.github.io/regenie/

system("regenie --step 2 --bgen ukb21007_c22_b0_v1.bgen --sample ukb21007_c22_b0_v1.sample --phenoFile filter_status_BC.txt --covarFile filter_cov_BC.txt --pred step1_chr22_pred.list --bsize 400 --out step2_chr22")
#step 2 ERROR: header of phenotype file must start with: FID IID.

