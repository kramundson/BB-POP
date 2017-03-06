#! /bin/bash
# unzip-allprep.sh
gunzip *.gz
python ~/bin/allrpep-12.py -b H860P-barcodes.txt -f H860P_Amundson_S2_L007_R1_001.fastq -r H860P_Amundson_S2_L007_R4_001.fastq.gz -i H860P_Amundson_S2_L007_R2_001.fastq.gz -I H860P_Amundson_S2_L007_R3_001.fastq.gz -m -D -n
gzip *.fastq
