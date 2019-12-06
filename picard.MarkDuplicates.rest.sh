#! /bin/bash
#$ -S /bin/bash
#$ -o ~/Data/sge_sys_o/picard.MarkDuplicate.out
#$ -e ~/Data/sge_sys_o/picard.MarkDuplicate.err
#$ -N MarkDuplicates
#$ -l h_vmem=60G
#$ -cwd
#$ -t 1-4

InDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.stepfile/
OutDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/variant.call.stepfile/
cd $InDir
samplenames=(X 10_S10_L007_R1_001.Aligned.out.sam.bam 14_S14_L007_R1_001.Aligned.out.sam.bam 19_S19_L006_R1_001.Aligned.out.sam.bam 18_S18_L006_R1_001.Aligned.out.sam.bam)


# MarkDuplicates for rest files requires larger virtual memory
echo $SGE_TASK_ID
export name=${samplenames[$SGE_TASK_ID]}
marker=$(echo $name | cut -d . -f 1)
echo $marker
java -jar ~/picard/picard.jar MarkDuplicates I=$name O=$marker.dedupped.bam CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT M=$marker.metrics

