#!/bin/bash
#SBATCH --job-name=mtag
#SBATCH --time=04:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --output=mtag.%j.out
#SBATCH --error=mtag.%j.err

#intsalling mtag on hpc

module load anaconda  
source activate mtag_py27

git clone https://github.com/omeed-maghzian/mtag.git
cd mtag
chmod +x mtag.py
./mtag.py -h

cd /home/cn490/rds/rds-ccge1-hdMXhK21vco/benign/mtag

#in case of errors
conda init bash

conda create -n mtag_py27 python=2.7 numpy scipy pandas joblib bitarray -y
conda activate mtag_py27


python ./mtag.py \
  --sumstats /home/cn490/rds/rds-ccge1-hdMXhK21vco/benign/gwas_res/breast/dcis.sig.txt,/home/cn490/rds/rds-ccge1-hdMXhK21vco/benign/gwas_res/breast/bc.sig.txt \
  --out /home/cn490/rds/rds-ccge1-hdMXhK21vco/benign/mtag/bc_dcis_mtag \
  --n_min 0.0 \
  --stream_stdout


