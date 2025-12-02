#!/bin/bash

#lc smoker
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_lung="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_lung"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_lung_smoker="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/lung_smoker"

# Common file paths
pheno_file_lc_smoker="${pheno_dir_lung}/lc_smoker.txt"
remove_file_lung="${pheno_dir_lung}/fid_to_remove_lung.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_pred.list"
loco_1_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_1.loco"
loco_2_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_2.loco"


for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lc_smoker}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_smoker}" \
        -iin="${loco_1_lung_smoker}" \
        -iin="${loco_2_lung_smoker}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lc_smoker.txt --remove fid_to_remove_lung.txt --phenoColList lc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_smoker_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lc_smoker" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lc_smoker" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

for chr in {5..14} {16..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lc_smoker}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_smoker}" \
        -iin="${loco_1_lung_smoker}" \
        -iin="${loco_2_lung_smoker}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lc_smoker.txt --remove fid_to_remove_lung.txt --phenoColList lc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_smoker_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lc_smoker" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lc_smoker" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done
####################################################################################################################
####################################################################################################################

#lc neversmoke
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_lung="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_lung"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_lung_neversmoke="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/lung_neversmoke"

# Common file paths
pheno_file_lc_neversmoke="${pheno_dir_lung}/lc_neversmoke.txt"
remove_file_lung="${pheno_dir_lung}/fid_to_remove_lung.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_pred.list"
loco_1_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_1.loco"
loco_2_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_2.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lc_neversmoke}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_neversmoke}" \
        -iin="${loco_1_lung_neversmoke}" \
        -iin="${loco_2_lung_neversmoke}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lc_neversmoke.txt --remove fid_to_remove_lung.txt --phenoColList lc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_never_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lc_neversmoke" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lc_neversmoke" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

for chr in {5..14} {16..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lc_neversmoke}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_neversmoke}" \
        -iin="${loco_1_lung_neversmoke}" \
        -iin="${loco_2_lung_neversmoke}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lc_neversmoke.txt --remove fid_to_remove_lung.txt --phenoColList lc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_never_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lc_neversmoke" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lc_neversmoke" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

###############################################################################################################
################################################################################################################

#nodules smoker
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_lung="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_lung"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_lung_smoker="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/lung_smoker"

# Common file paths
pheno_file_nodules_smoker="${pheno_dir_lung}/nodules_pros_smoker.txt"
remove_file_lung="${pheno_dir_lung}/fid_to_remove_lung.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_pred.list"
loco_1_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_1.loco"
loco_2_lung_smoker="${pred_dir_lung_smoker}/ukb_step1_BT_lung_smoker_2.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_nodules_smoker}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_smoker}" \
        -iin="${loco_1_lung_smoker}" \
        -iin="${loco_2_lung_smoker}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile nodules_pros_smoker.txt --remove fid_to_remove_lung.txt --phenoColList nodules_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_smoker_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_nodules_smoker" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_nodules_smoker" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

for chr in {5..14} {16..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_nodules_smoker}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_smoker}" \
        -iin="${loco_1_lung_smoker}" \
        -iin="${loco_2_lung_smoker}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile nodules_pros_smoker.txt --remove fid_to_remove_lung.txt --phenoColList nodules_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_smoker_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_nodules_smoker" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_nodules_smoker" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

##################################################################################################################
##################################################################################################################

#nodules neversmoke
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_lung="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_lung"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_lung_neversmoke="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/lung_neversmoke"

# Common file paths
pheno_file_nodules_neversmoke="${pheno_dir_lung}/nodules_pros_neversmoke.txt"
remove_file_lung="${pheno_dir_lung}/fid_to_remove_lung.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_pred.list"
loco_1_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_1.loco"
loco_2_lung_neversmoke="${pred_dir_lung_neversmoke}/ukb_step1_BT_lung_never_2.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_nodules_neversmoke}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_neversmoke}" \
        -iin="${loco_1_lung_neversmoke}" \
        -iin="${loco_2_lung_neversmoke}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile nodules_pros_neversmoke.txt --remove fid_to_remove_lung.txt --phenoColList nodules_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_never_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_nodules_neversmoke" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_nodules_neversmoke" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done

for chr in {5..14} {16..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_nodules_neversmoke}" \
        -iin="${remove_file_lung}" \
        -iin="${covar_file}" \
        -iin="${pred_list_lung_neversmoke}" \
        -iin="${loco_1_lung_neversmoke}" \
        -iin="${loco_2_lung_neversmoke}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile nodules_pros_neversmoke.txt --remove fid_to_remove_lung.txt --phenoColList nodu --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_lung_never_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_nodules_neversmoke" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_nodules_neversmoke" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/lung/" \

done


