#!/bin/bash

#bc
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_breast/step2"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/breast"

pheno_file_bc="${pheno_dir_breast}/bc.txt"
remove_file_breast="${pheno_dir_breast}/fid_to_remove_breast.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_breast="${pred_dir_breast}/ukb_step1_BT_pred.list"
loco_6_breast="${pred_dir_breast}/ukb_step1_BT_6.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_bc}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${loco_6_breast}" \
        -iin="${pred_list_breast}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile bc.txt --remove fid_to_remove_breast.txt --phenoColList bc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_bc" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_bc" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

for chr in {5..21}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_bc}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${loco_6_breast}" \
        -iin="${pred_list_breast}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile bc.txt --remove fid_to_remove_breast.txt --phenoColList bc --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_bc" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_bc" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

#####################################################################################################################
#####################################################################################################################

#bbd_pl_pros + bbd_npl_pros + bbd_bn_pros
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_breast/step2"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/breast"

pheno_file_benign="${pheno_dir_breast}/pheno_benign_breast.txt"
remove_file_breast="${pheno_dir_breast}/fid_to_remove_breast.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_breast="${pred_dir_breast}/ukb_step1_BT_pred.list"
loco_1_breast="${pred_dir_breast}/ukb_step1_BT_1.loco"
loco_2_breast="${pred_dir_breast}/ukb_step1_BT_2.loco"
loco_3_breast="${pred_dir_breast}/ukb_step1_BT_3.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_benign}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${loco_1_breast}" \
        -iin="${loco_2_breast}" \
        -iin="${loco_3_breast}" \
        -iin="${pred_list_breast}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile pheno_benign_breast.txt --remove fid_to_remove_breast.txt --phenoColList bbd_pl_pros,bbd_npl_pros,bbd_bn_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_benign" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_benign_breast" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

for chr in {5..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_benign}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${loco_1_breast}" \
        -iin="${loco_2_breast}" \
        -iin="${loco_3_breast}" \
        -iin="${pred_list_breast}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile pheno_benign_breast.txt --remove fid_to_remove_breast.txt --phenoColList bbd_pl_pros,bbd_npl_pros,bbd_bn_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_benign" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_benign_breast" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

###########################################################################################################
###########################################################################################################

#dcis_pros
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_breast/step2"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/breast"

pheno_file_dcis="${pheno_dir_breast}/dcis_pros.txt"
remove_file_breast="${pheno_dir_breast}/fid_to_remove_breast.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_breast="${pred_dir_breast}/ukb_step1_BT_pred.list"
loco_4="${pred_dir_breast}/ukb_step1_BT_4.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_dcis}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${pred_list_breast}" \
        -iin="${loco_4}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile dcis_pros.txt --remove fid_to_remove_breast.txt --phenoColList dcis_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_dcis" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_dcis" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

for chr in {5..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_dcis}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${pred_list_breast}" \
        -iin="${loco_4}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile dcis_pros.txt --remove fid_to_remove_breast.txt --phenoColList dcis_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_dcis" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_dcis" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

######################################################################################################################
######################################################################################################################

#lcis_pros
bgen_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/Bulk/Imputation/Imputation from genotype (TOPmed)"
pheno_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data/gwas_pheno_breast/step2"
covar_dir="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/pheno_data"
pred_dir_breast="project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step1/breast"

pheno_file_lcis="${pheno_dir_breast}/lcis_pros.txt"
remove_file_breast="${pheno_dir_breast}/fid_to_remove_breast.txt"
covar_file="${covar_dir}/covariates.txt"
pred_list_breast="${pred_dir_breast}/ukb_step1_BT_pred.list"
loco_5="${pred_dir_breast}/ukb_step1_BT_5.loco"

for chr in {1..4}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lcis}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${pred_list_breast}" \
        -iin="${loco_5}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lcis_pros.txt --remove fid_to_remove_breast.txt --phenoColList lcis_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lcis" \
        --instance-type mem3_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lcis" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done

for chr in {5..22}; do

    bgen_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.bgen"
    sample_file="${bgen_dir}/ukb21007_c${chr}_b0_v1.sample"

    dx run app-swiss-army-knife \
        -iin="${bgen_file}" \
        -iin="${sample_file}" \
        -iin="${pheno_file_lcis}" \
        -iin="${remove_file_breast}" \
        -iin="${covar_file}" \
        -iin="${pred_list_breast}" \
        -iin="${loco_5}" \
        -icmd="mkdir -p tmpdir && regenie --step 2 --bgen ukb21007_c${chr}_b0_v1.bgen --ref-first --sample ukb21007_c${chr}_b0_v1.sample --phenoFile lcis_pros.txt --remove fid_to_remove_breast.txt --phenoColList lcis_pros --covarFile covariates.txt --covarColList PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --pred ukb_step1_BT_pred.list --bt --firth --approx --pThresh 0.01 --bsize 1000 --af-cc --lowmem --lowmem-prefix regenie_tmp --threads 4 --out ukb_step2_BT_chr${chr}_lcis" \
        --instance-type mem1_ssd2_v2_x4 \
        --priority high \
        --name "regenie_step2_chr${chr}_lcis" \
        --destination "project-GypBPq0Jf7kBGqKGJqVKBjg3:/benign_precursor/results/regenie_step2/breast/" \
        --yes \

done










