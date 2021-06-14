#!/bin/bash

#SBATCH --job-name=mpi-test
# Number of Nodes
#SBATCH --nodes=2
# Number of processes per Node
#SBATCH --ntasks-per-node=2
# Number of CPU-cores per task
#SBATCH --cpus-per-task=2
# Total number of tasks
#SBATCH --ntasks=4
# Set memory allocation per cpu
#SBATCH --mem-per-cpu 1G
# Disable Hyperthreads
#SBATCH --ntasks-per-core=1
# Set output folder
#SBATCH -o ./output/output_%j.out

#export SPARK_HOME=/glusterfs/pool-gfs-dist/spark/spark-3.1.1-bin-hadoop3.2

#VERSION=spark-3.1.1-bin-hadoop3.2
#DIRECTORY=/glusterfs/pool-gfs-dist/spark

#Credit: https://stackoverflow.com/questions/56962129/how-to-get-original-location-of-script-used-for-slurm-job
if [ -n $SLURM_JOB_ID ];  then
    # check the original location through scontrol and $SLURM_JOB_ID
    SCRIPT_PATH=$(scontrol show job $SLURM_JOBID | awk -F= '/Command=/{print $2}')
else
    # otherwise: started with bash. Get the real location.
    SCRIPT_PATH=$(realpath $0)
fi

REPO_PATH=$(dirname "${SCRIPT_PATH}")

export PATH=$PATH:/usr/lib64/mpi/gcc/openmpi4/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/mpi/gcc/openmpi4/lib64

RMAT_SCALE=15

echo ""
echo " About to run the mpi job"
echo ""

# Example using the metis-format
#srun --mpi=pmix_v3 ./build/Linux-x86_64/mpitc -iftype=metis  data/small-graph.metis -dbglvl=1

# Example using the rmat-generator
srun --mpi=pmix_v3 ./build/Linux-x86_64/mpitc -iftype=rmat -scale=${RMAT_SCALE} -dbglvl=1

