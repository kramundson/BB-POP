Document created 27 February 2017

Aim: Chromosome dosage characterization of Desiree x IVP-48 derived F1 dihaploids

Libraries of Desiree and IVP-48 were genereated using the KAPA Hyper Prep kit with 4 cycles of PCR enrichment according to manufacturer recommendations
with the following exceptions:

Library prep reactions for IVP-48 were done at full-scale.
Library prep reactions for Desiree were done at half-scale.

Prepped libraries were pooled 56% Desiree: 28% IVP-48: 16% DBW RESCAN1 based on qPCR and sequenced on an Illumina HS4000 lane  

## Download reads from UC Davis DNA sequencing technologies core

```
cd /cato2pool/backup-share/kramundson/Potato-snp/data/
wget -r -nH -nc -np -R index.html* http://slims.bioinformatics.ucdavis.edu/Data/3kn3bi8ys/Unaligned2/
```

TODO:
Allprep with quality trimming
Mapping to reference. Based on coverage, may want to sequence one or both lines deeper.
Send path for bams to Livingstone
Call Desiree/IVP-48 SNPs
