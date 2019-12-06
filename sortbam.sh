#!/bin/bash
InDir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/BAM/
Dir=/cellar/users/a53206221/Data/GBM_Maurizio_Brian/BAM/
cd $InDir
for f in 11_S11_L007_R1_001.Aligned.out.sam 12_S12_L007_R1_001.Aligned.out.sam 11_S11_L006_R1_001.Aligned.out.sam 12_S12_L006_R1_001.Aligned.out.sam 1_S1_L007_R1_001.faAligned.out.sam 3_S3_L007_R1_001.faAligned.out.sam 2_S2_L007_R1_001.faAligned.out.sam 7_S7_L007_R1_001.faAligned.out.sam 10_S10_L006_R1_001.Aligned.out.sam 2_S2_L006_R1_001.faAligned.out.sam 15_S15_L007_R1_001.Aligned.out.sam 9_S9_L006_R1_001.faAligned.out.sam 20_S20_L007_R1_001.Aligned.out.sam 8_S8_L007_R1_001.faAligned.out.sam 4_S4_L007_R1_001.faAligned.out.sam 5_S5_L007_R1_001.faAligned.out.sam 20_S20_L006_R1_001.Aligned.out.sam 19_S19_L007_R1_001.Aligned.out.sam 18_S18_L006_R1_001.Aligned.out.sam 1_S1_L006_R1_001.faAligned.out.sam 18_S18_L007_R1_001.Aligned.out.sam 14_S14_L006_R1_001.Aligned.out.sam 13_S13_L007_R1_001.Aligned.out.sam 8_S8_L006_R1_001.faAligned.out.sam 19_S19_L006_R1_001.Aligned.out.sam 17_S17_L007_R1_001.Aligned.out.sam 9_S9_L007_R1_001.faAligned.out.sam 4_S4_L006_R1_001.faAligned.out.sam 16_S16_L006_R1_001.Aligned.out.sam 17_S17_L006_R1_001.Aligned.out.sam 6_S6_L006_R1_001.faAligned.out.sam 5_S5_L006_R1_001.faAligned.out.sam 3_S3_L006_R1_001.faAligned.out.sam 7_S7_L006_R1_001.faAligned.out.sam 16_S16_L007_R1_001.Aligned.out.sam 6_S6_L007_R1_001.faAligned.out.sam 15_S15_L006_R1_001.Aligned.out.sam 10_S10_L007_R1_001.Aligned.out.sam 14_S14_L007_R1_001.Aligned.out.sam 13_S13_L006_R1_001.Aligned.out.sam
do
    export name=.bam
    export name=$f$name
    export name=$Dir$name
    samtools sort $name -o $name
done