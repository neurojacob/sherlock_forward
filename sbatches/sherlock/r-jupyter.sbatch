#!/bin/bash

PORT=$1
NOTEBOOK_DIR=$2
cd $NOTEBOOK_DIR

module load py-jupyter/1.0.0_py36
module load hdf5/1.10.6
module load py-tensorflow/2.1.0_py36
module load tbb/2019
#module load R/3.6.1
module load R/4.0.2
#following block is for a monocle3 dependency to work:
#module load hdf5/1.10.6
#module load py-tensorflow/2.1.0_py36
#module load physics
#module load gdal
#module load udunits
#module load proj
#module load geos

# have the script just load (and not need to compile and install!)


# Install devtools and IRkernel
Rscript -e "install.packages('devtools', repos='http://cran.us.r-project.org');"
Rscript -e "library('devtools'); devtools::install_github('IRkernel/IRkernel')"

# register the kernel in the current R installation
Rscript -e "IRkernel::installspec()"

jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10 --no-browser --port=$PORT
