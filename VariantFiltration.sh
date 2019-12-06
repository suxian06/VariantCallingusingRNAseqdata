#! /bin/bash
#$ -S /bin/bash
#$ -o ~/Data/sge_sys_o/Filtering.out
#$ -e ~/Data/sge_sys_o/Filtering.err
#$ -N Filtering
#$ -l h_vmem=20G
#$ -cwd
#$ -t 1-40

InDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.final/
OutDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.final/
cd $InDir
samplenames=(X 8_S8_L006_R1_001.split.bam.vcf 12_S12_L007_R1_001.split.bam.vcf 10_S10_L007_R1_001.split.bam.vcf 4_S4_L006_R1_001.split.bam.vcf 18_S18_L006_R1_001.split.bam.vcf 16_S16_L007_R1_001.split.bam.vcf 14_S14_L007_R1_001.split.bam.vcf 7_S7_L007_R1_001.split.bam.vcf 3_S3_L007_R1_001.split.bam.vcf 12_S12_L006_R1_001.split.bam.vcf 8_S8_L007_R1_001.split.bam.vcf 18_S18_L007_R1_001.split.bam.vcf 4_S4_L007_R1_001.split.bam.vcf 10_S10_L006_R1_001.split.bam.vcf 16_S16_L006_R1_001.split.bam.vcf 3_S3_L006_R1_001.split.bam.vcf 7_S7_L006_R1_001.split.bam.vcf 14_S14_L006_R1_001.split.bam.vcf 13_S13_L006_R1_001.split.bam.vcf 19_S19_L007_R1_001.split.bam.vcf 2_S2_L007_R1_001.split.bam.vcf 6_S6_L007_R1_001.split.bam.vcf 11_S11_L006_R1_001.split.bam.vcf 20_S20_L006_R1_001.split.bam.vcf 9_S9_L006_R1_001.split.bam.vcf 17_S17_L006_R1_001.split.bam.vcf 5_S5_L006_R1_001.split.bam.vcf 15_S15_L006_R1_001.split.bam.vcf 1_S1_L006_R1_001.split.bam.vcf 13_S13_L007_R1_001.split.bam.vcf 11_S11_L007_R1_001.split.bam.vcf 6_S6_L006_R1_001.split.bam.vcf 2_S2_L006_R1_001.split.bam.vcf 19_S19_L006_R1_001.split.bam.vcf 9_S9_L007_R1_001.split.bam.vcf 20_S20_L007_R1_001.split.bam.vcf 17_S17_L007_R1_001.split.bam.vcf 1_S1_L007_R1_001.split.bam.vcf 15_S15_L007_R1_001.split.bam.vcf 5_S5_L007_R1_001.split.bam.vcf)

echo $SGE_TASK_ID
export name=${samplenames[$SGE_TASK_ID]}
marker=$(echo $name | cut -d . -f 1)
echo $marker
~/java.1.8/jre1.8.0_211/bin/java -jar ~/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar VariantFiltration -R ~/Data/genomeDir/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa -V $name -O $marker.filtered.vcf -window 35 --filter-name QD --filter-expression "QD < 2.0" --filter-name FS --filter-expression "FS > 30.0"