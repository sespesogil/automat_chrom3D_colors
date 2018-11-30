# automat_chrom3D_colors
Utility to color beads in chrom3D 

![alt text](https://xespes10.u.hpc.mssm.edu/images/schematic_3.png)


# Required dependencies 
- Python 2.7 
- bedtools
- [NCHG](http://folk.uio.no/jonaspau/hic/NCHG_hic.zip)


Download and install NCHG 

```curl -O http://folk.uio.no/jonaspau/hic/NCHG_hic.zip ``` <br/>
```unzip NCHG_hic.zip ``` <br/>
```cd NCHG_hic ```  <br/>
```make ```  <br/>
```export PATH=$PATH:${PWD} ```   

Add to the preprocess__script-master folder the scripts found in this repository.

# Usage

For haploid versions: 

```automat_chrom3D_colors.haploid.sh  filename.cmm  ROI.bed  RGB_colors  override/blend```

For diploid versions:

```automat_chrom3D_colors.diploid.sh  filename.cmm  ROI.bed  RGB_colors  override/blend```

```filename.cmm```= chrom3D cmm file. <br/>
```ROI.bed```= bedfile containing the regions of interes to be colored. <br/>
```RGB_colors```= separated values of RGB gradient (blue: 000,000,250). <br/>
```override/blend```= if this is the first time you are using this script you should choose the "override" option. You can continue coloring other beads using the ROI.cmm resulting output and selecting other regions of interest, then use "blend". <br/>

