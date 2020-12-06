#!/bin/bash
set -e -x

ref_fastafn=$1
outdir=$2

samtools faidx ${ref_fastafn}

for folder in minimap2 pbmm2 blasr
do
    mkdir -p ${outdir}/${folder}
    if [ ! -s ${outdir}/${folder}/ref.fa.fai ]
    then
	ln -s ${ref_fastafn} ${outdir}/${folder}/ref.fa
	samtools faidx ${outdir}/${folder}/ref.fa
    fi
done

minimap2 -x map-ont -d ${outdir}/minimap2/ref.mmi ${outdir}/minimap2/ref.fa
minimap2 -x map-pb -d ${outdir}/minimap2/ref.mmi ${outdir}/minimap2/ref.fa

pbmm2 index ${outdir}/pbmm2/ref.fa ${outdir}/pbmm2/ref.mmi

sawriter ${outdir}/blasr/ref.fa
