# Mutation calling using RNAseq

Variant calling pipeline using RNAseq data, removing potential bias caused by SERCA mutation, in the paper [IRE1α and IGF signaling predict resistance to an endoplasmic reticulum stress-inducing drug in glioblastoma cells](https://www.nature.com/articles/s41598-020-65320-6)

1. All .bam files processed using GRCh38 from Ensembl using STAR aligner.
2. All .bam files are sorted using samtools sort command
3. The .bai files are indexing files of the .bam
    
## Steps I used in TEST.bam

### Add Read Groups and Go Through Variant Calling
```bash
Picard addReadGroups (RG)
java -jar picard.jar AddOrReplaceReadGroups 
I=star_output.sam 
O=rg_added_sorted.bam 
SO=coordinate 
RGID=id 
RGLB=library 
RGPL=platform 
RGPU=machine 
RGSM=sample
```
### Mark Duplicates
```bash
Picard markDuplicates
java -jar picard.jar MarkDuplicates 
I=rg_added_sorted.bam 
O=dedupped.bam  
CREATE_INDEX=true 
VALIDATION_STRINGENCY=SILENT 
M=output.metrics
```

### SplitNCigarReads (30 min, test file)
```bash
SplitNCigarReads by GATK (4.xx uptodate version)
./java -jar ~/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SplitNCigarReads 
-R ~/Data/genomeDir/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa 
-I ~/Data/GBM_Maurizio_Brian/TEST.dedupped.bam 
-O ~/Data/GBM_Maurizio_Brian/TEST.split.bam
```

### Mutation Calling (61 mins)
```bash
HaplotypeCaller by GATK 4.12
./java -jar ~/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar HaplotypeCaller 
-R ~/Data/genomeDir/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa 
-I ~/Data/GBM_Maurizio_Brian/TEST.split.bam 
-O  ~/Data/GBM_Maurizio_Brian/TEST.split.vcf 
--dont-use-soft-clipped-bases true -stand-call-conf 20.0
```
### Filtering
```bash
VariantFiltration by GATK 4.12
./java -jar ~/GATK/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar VariantFiltration 
-R ~/Data/genomeDir/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa 
-V ~/Data/GBM_Maurizio_Brian/TEST.split.bam 
-O  ~/Data/GBM_Maurizio_Brian/TEST.split.filtered.vcf
-window 35 --filter-name QD --filter-expression "QD < 2.0" --filter-name FS --filter-expression "FS > 30.0"
```

### Reference

See the [GATK forum](https://gatkforums.broadinstitute.org/gatk/discussion/3891/calling-variants-in-rnaseq)

Though the results are not as confident as using WGS or WXS, it is an alternative method to check for mutations of interests when the only data available is RNAseq and I also have enough sample replicates to ensure the accuracy.
