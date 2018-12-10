

<<<<<<< HEAD
pure_pop1=$1
pure_pop2=$2
num_admixed=$3
num_pure=$4

logf="run_pipeline.log"
errf="run_pipeline.err"
touch $logf $errf

cat $errf >> $errf.full
cat $logf >> $logf.full
rm $logf $errf
 
=======
>>>>>>> 40d2bd19cbf37a9c29c9609cec3aa3a8a7fae787
admixed_output_homologous_file="pops_data/admixed/${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure_HOMOLOGOUS.vcf"
admixed_output_allele_file="pops_data/admixed/${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure_ALLELE_vcf.txt"
admixed_proportions_file="pops_data/admixed/${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure_proportions.txt"

plink_output_file_prefix="pops_data/admixture/bed/${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure"
# First we prune the file to eliminate SNPs that are linked
plink2 --vcf ${admixed_output_homologous_file}  --indep-pairwise 50 5 0.5 --out tmp_plink1_out >> $logf 2>> $errf
# Now lets use the prune.in file to generate the bed file
plink2 --vcf ${admixed_output_homologous_file}  --extract tmp_plink1_out.prune.in --make-bed --thin 0.9 --out ${plink_output_file_prefix} >> $logf 2>> $errf
/bin/rm tmp_plink1_out*

admixture --cv ${plink_output_file_prefix}.bed 2 >> $logf 2>> $errf
<<<<<<< HEAD
mv ${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure.2.* pops_data/admixture
=======
mv ${pure_pop1}_${pure_pop2}_admixed_${num_admixed}admixed_${num_pure}pure.2.* pops_data/admixture	
>>>>>>> 40d2bd19cbf37a9c29c9609cec3aa3a8a7fae787
