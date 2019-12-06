#! /bin/bash
#$ -S /bin/bash
#$ -o ~/Data/sge_sys_o/HaplotypeCaller.out
#$ -e ~/Data/sge_sys_o/HaplotypeCaller.err
#$ -N HaplotypeCaller
#$ -l h_vmem=40G
#$ -cwd
#$ -t 1-40

InDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.stepfile/
OutDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.final/
cd $InDir
samplenames=(X 11_S11_L007_R1_001.split.bam 6_S6_L007_R1_001.split.bam 13_S13_L006_R1_001.split.bam 11_S11_L006_R1_001.split.bam 6_S6_L006_R1_001.split.bam 13_S13_L007_R1_001.split.bam 17_S17_L007_R1_001.split.bam 15_S15_L006_R1_001.split.bam 17_S17_L006_R1_001.split.bam 15_S15_L007_R1_001.split.bam 7_S7_L007_R1_001.split.bam 7_S7_L006_R1_001.split.bam 1_S1_L007_R1_001.split.bam 19_S19_L006_R1_001.split.bam 19_S19_L007_R1_001.split.bam 1_S1_L006_R1_001.split.bam 9_S9_L006_R1_001.split.bam 4_S4_L006_R1_001.split.bam 9_S9_L007_R1_001.split.bam 4_S4_L007_R1_001.split.bam 18_S18_L006_R1_001.split.bam 2_S2_L006_R1_001.split.bam 18_S18_L007_R1_001.split.bam 2_S2_L007_R1_001.split.bam 8_S8_L006_R1_001.split.bam 10_S10_L007_R1_001.split.bam 5_S5_L006_R1_001.split.bam 12_S12_L006_R1_001.split.bam 20_S20_L006_R1_001.split.bam 8_S8_L007_R1_001.split.bam 10_S10_L006_R1_001.split.bam 5_S5_L007_R1_001.split.bam 12_S12_L007_R1_001.split.bam 20_S20_L007_R1_001.split.bam 16_S16_L007_R1_001.split.bam 3_S3_L006_R1_001.split.bam 14_S14_L006_R1_001.split.bam 16_S16_L006_R1_001.split.bam 3_S3_L007_R1_001.split.bam 14_S14_L007_R1_001.split.bam)

echo $SGE_TASK_ID
export name=${samplenames[$SGE_TASK_ID]}
~/java.1.8/jre1.8.0_211/bin/java -jar ~/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar HaplotypeCaller -R ~/Data/genomeDir/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa -I $name -O $OutDir$name.vcf --dont-use-soft-clipped-bases true -stand-call-conf 20.0