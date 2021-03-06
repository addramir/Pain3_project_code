#!/bin/bash
#$ -S /bin/sh
#$ -cwd
#$ -N Back
#$ -j y
#$ -l h_vmem=19G
#$ -pe smp 10

## Replication for Backpain
## Chronic pain
## Afriacans, N = ~7500

DIRbolt=/mnt/lustre/users/DTR/k1471250/tools/BOLT-LMM_v2.3.2/
DIRphen=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/mar18/phen/chron
DIRbgen=/mnt/lustre/datasets/ukbiobank/June2017/Imputed/

$DIRbolt/bolt \
--bed=/mnt/lustre/datasets/ukbiobank/June2017/Genotypes/ukb_binary_v2.bed \
--bim=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/mar18/ukb18219.bim \
--fam=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/mar18/ukb18219.fam \
--remove=$DIRphen/mv_mar18_cron.repl.AA_excl.txt \
--remove=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/mar18/phen/bolt.in_plink_but_not_imputed.FID_IID.968.txt \
--phenoFile=$DIRphen/mv_mar18_chron.phen.txt \
--phenoCol=back \
--covarFile=$DIRphen/mv_mar18_chron.phen.txt \
--covarCol=Sex \
--covarCol=batch \
--qCovarCol=Age \
--qCovarCol=pc{1:10} \
--LDscoresFile=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/ldsc/afr/afr500_LDscore_BOLT.gz \
--geneticMapFile=$DIRbolt/tables/genetic_map_hg19_withX.txt.gz \
--lmm \
--maxMissingPerSnp=0.02 \
--maxMissingPerIndiv=0.02 \
--numThreads=10 \
--statsFile=mv_back_repl.aa_gwas.stats.txt.gz \
--bgenFile=$DIRbgen/ukb_imp_chr{1:22}_v3.bgen \
--sampleFile=/mnt/lustre/users/DTR/k1471250/UKBB/ukbb500/mar18/ukb18219_imp_chr1_v3_s487395.sample \
--statsFileBgenSnps=MV_Back_Repl.AA_gwas.BGEN.stats.txt.gz \
--noMapCheck \
--verboseStats
