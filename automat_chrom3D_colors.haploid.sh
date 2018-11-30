#!/bin/bash

module load bedtools/2.24.0 python py_packages

grep beadID $1 | awk -F' ' '{print $11}' | sed -e "s/[=:-]\+/\t/g" | sed -e "s/[_AB]\+//g" | sed 's/\"/\t/g' | awk -F'\t' '{print $3"\t"$4"\t"$5"\t"}' > bead.ids

bedtools intersect -a bead.ids -b $2 -wa > temp

rm bead.ids

awk -F'\t' '{print $1":"$2"-"$3}' temp > coord.bed


python color_beads.py $1 coord.bed $3 $4 > $1.ROI.cmm

rm temp coord.bed
