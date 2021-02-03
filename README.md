# bioinformatics-common
Scripts useful for across projects

## Index reference for minimap2 and blasr
```
sh create_ref_index.sh <inputs>
```
## Turning PacBio BAM raw data to FASTQ files
https://github.com/PacificBiosciences/bam2fastx

## Align reads to reference
```
sh map_minimap2_ont.sh  <inputs>
sh map_minimap2_pacb.sh <inputs>
sh map_blasr.sh <inputs>
```

## Call SNPs using long reads
```
sh get_snps_from_long_reads.sh <inputs>
```
