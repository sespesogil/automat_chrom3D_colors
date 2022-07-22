#!/bin/bash

# load appropiated modules

grep beadID $1 | awk -F' ' '{print $11}' | sed -e "s/[=:-]\+/\t/g" | sed -e "s/[_AB]\+//g" | sed 's/\"/\t/g' | awk -F'\t' '{print $3"\t"$4"\t"$5}' > bead.ids

bedtools intersect -a bead.ids -b $2 -wa > temp

rm bead.ids

awk -F'\t' '{print $1":"$2"-"$3}' temp > coord.bed

python make_diploid_gtrack.py coord.bed > color_beads.ids

python color_beads.py $1 color_beads.ids $3 $4 > $1.ROI.cmm

rm temp coord.bed color_beads.ids
