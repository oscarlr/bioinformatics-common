#!/bin/bash
set -e -x

ref_fastafn=$1 # Full path only
outdir=$2 # Full path only

samtools faidx ${ref_fastafn}

for folder in minimap2_pb minimap2_ont pbmm2 blasr
do
    mkdir -p ${outdir}/${folder}
    if [ ! -s ${outdir}/${folder}/ref.fa.fai ]
    then
	ln -s ${ref_fastafn} ${outdir}/${folder}/ref.fa
	samtools faidx ${outdir}/${folder}/ref.fa
    fi
done

minimap2 -x map-ont -d ${outdir}/minimap2_ont/ref.mmi ${outdir}/minimap2_ont/ref.fa
minimap2 -x map-pb -d ${outdir}/minimap2_pb/ref.mmi ${outdir}/minimap2_pb/ref.fa

sawriter ${outdir}/blasr/ref.fa

pbmm2 index ${outdir}/pbmm2/ref.fa ${outdir}/pbmm2/ref.mmi
