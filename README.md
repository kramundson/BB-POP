Document created 27 February 2017

Aim: Chromosome dosage characterization of Desiree x IVP-48 derived F1 dihaploids

Libraries of Desiree and IVP-48 were genereated using the KAPA Hyper Prep kit with 4 cycles of PCR enrichment according to manufacturer recommendations
with the following exceptions:

Library prep reactions for IVP-48 were done at full-scale.
Library prep reactions for Desiree were done at half-scale.

Prepped libraries were pooled 56% Desiree: 28% IVP-48: 16% DBW RESCAN1 based on qPCR and sequenced on an Illumina HS4000 lane  

### Download reads from UC Davis DNA sequencing technologies core

```
cd /cato2pool/backup-share/kramundson/Potato-snp/data/
wget -r -nH -nc -np -R index.html* http://slims.bioinformatics.ucdavis.edu/Data/3kn3bi8ys/Unaligned2/
mkdir ./Project_LCKA_L7_H860P_Amundson
mv Data/3kn3bi8ys/Unaligned2/Project_LCKA_L7_H860P_Amundson/*.* /cato2pool/backup-share/kramundson/Potato_snp/data/Project_LCKA_L7_H860P_Amundson/
rm -r Data/
```

### Demultiplex with allprep-12.py (allprep from Meric Lieberman called from unzip-allprep.sh)
Single nt mismatches allowed in index reads, demultiplex only, sequences with any number of N nucleotides not automatically rejected.

```
cd ./Project_LCKA_L7_H860P_Amundson
./unzip-allprep.sh
```

Elapsed: 194m 15s Remaining: -52m 30s Good: 380466157 Rejected 25331529 Total: 405797686

Number of pairs (grep -c "^@J00" *.fq divided by 2)

2175-21.fq:7723512
2175-29.fq:10651554
2175-33.fq:9748307
Desiree.fq:214626726
IVP-48.fq:108318622
LA0716.fq:10243896
LA4331.fq:9934358
NC84173.fq:9219182

```
mkdir DBW_RESCAN
mv 2*.fq LA*.fq NC*.fq DBW_RESCAN/
md5sum DBW_RESCAN/*.fq >> DBW_RESCAN/fq-md5.txt
tar -cvzf DBW_RESCAN.tar.gz DBW_RESCAN/
```

Quality Trimming:

```
mv IVP-48.fq IVP-48_preQC.fq
mv Desiree.fq Desiree_preQC.fq
Filter_N_Adapter_Trim_Batchmode_nounzip.py 40 -p
```

Total:
214626726
Filtered:
214626726
no Ns:
207032558
Good Reads or Pairs:
195911410
IVP-48_preQC.fastq
Running Paired-End Reads
Total:
108318622
Filtered:
108318622
no Ns:
104471476
Good Reads or Pairs:
98438659

Map quality-trimmed reads to reference (based on coverage, may want to sequence one or both lines deeper):

```
bwa-doall-vModules-current.py -d ~/Potato_dosage/Data/genome/potato_dm_v404_all_pm_un.fasta -O -m ps -t 8 -M
```

TODO:

Call Desiree/IVP-48 SNPs w/mpileup. Need to clear disk space on Isner first.

```
cd ~/Potato_snp
mv Project_LCKA_L7_H860P_Amundson/ /cato2pool/backup-share/kramundson/Potato_snp/
```

Livingstone: .bam files at path /cato2pool/backup-share/kramundson/Potato_snp/bam/
