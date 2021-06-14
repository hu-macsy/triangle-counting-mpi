# triangle counting with MPI

This repository is based on [KarypisLab/2DTriangleCounting](https://github.com/KarypisLab/2DTriangleCounting) and rewritten to work with slurm. The original Readme, describing and showing the original setup and triangle-counting algorithm was moved to [doc/README.md](https://github.com/hu-macsy/triangle-counting-mpi/blob/master/doc/README.md).

## Running MPI on a local system

In general there are multiple ways to setup MPI on your local system. Note that while this works, in principal MPI is designed to solve problems on multiple nodes. You can of course use a local notebook/workstation to test your solution. The following setup uses OpenMPI4, since the base repository refers to it. It is advised to also use OpenMPI4 in the following. Both the setup for local MPI and for using the infrastructure of the department will also refers to it. 

1. Setup mpi-environment. This tutorial uses [conda](https://www.anaconda.com/products/individual) (both `anaconda` and `miniconda` work). Feel free to use other ways of installation like system-packages, other package managers or a self-built OpenMPI4 version. In this case be sure to properly setup `PATH` and `LD_LIBRARY_PATH`. 

```
conda create -n triangle_mpi 
conda activate triangle_mpi
conda config --add channels conda-forge
conda install -c conda-forge openmpi openmpi-mpicc openmpi-mpicxx openmpi-mpifort
```

2. Clone repo and cd into repo:

```
git clone https://github.com/hu-macsy/triangle-counting-mpi/
cd triangle-counting-mpi
```

3. Execute `mpirun`:

```
mpirun -np 4 ./build/Linux-x86_64/mpitc  -iftype=metis data/small-graph.metis
# or
mpirun -np 4 ./build/Linux-x86_64/mpitc  -iftype=rmat -scale=15
```

The number of ranks (`-np`) must be a square number (4,9, 16, etc.), while the smallest supported number is four. Without defining additional parameters, `mpirun` launches the binary on localhost (four times in the example). Depnding on the number of cores in your notebook/workstation it can make sense to increase the number of ranks. In general, a high number of ranks on one node result in a performance degredation. 

## Running spark with slurm (multi process)

Besides the possibilty to setup a personal MPI-infrastructure, a slurm wrapper is available (scheduling system). This repo provides a complete and portable script, ready-to-use with the slurm infrastructure at the HU department of Computer Science. For more background information on how slurm works, there is german [doc site](https://www.informatik.hu-berlin.de/de/org/rechnerbetriebsgruppe/dienste/hpc/slurm) available. If you want to use it on other slurm-based infrastructures, minor edits have to be done.

The following is a minimal example of how to run the code of this repo in the infrastructure. 

1. Login to any slurm-pool nodes (note: gruenauX currently do not work for MPI-slurm submissions). The following nodes are part of the slurm-pool: `adlershof,alex,britz,buch,buckow,chekov,dahlem,dax,dukat,garak,gatow,karow,kes,kira,kudamm,lankwitz,marzahn,mitte,nog,odo,pankow,picard,pille,quark,rudow,scotty,sisko,spandau,staaken,steglitz,sulu,tegel,treptow,troi,uhura,wannsee,wedding`

```
ssh <USERNAME>@<SLURM-POOL-NODE>
```

Note: This requires that you have remote access to the HU department of Computer Science server. Normally this is achieved by using either CSM or the department VPN-service.

2. Clone repo and cd into repo:

```
git clone https://github.com/hu-macsy/triangle-counting-mpi/
cd triangle-counting-mpi
```

3. Submit job to slurm via `sbatch`:

```
sbatch triangle-counting-mpi.sh
```

Note: OpenMPI4 and other dependencies are already installed on the nodes. 

You can view the current status of your task by calling `squeue`:

```
brandtfa 54 ( triangle-counting-mpi ) $ squeue
JOBID      PARTITION     NAME     USER      ST       TIME       NODES NODELIST(REASON)
67108957   defq          mpi-test brandtfa  R        00:24      2     kudamm,lankwitz
```

Both log and output from the job is written to `output`-folder. The file-names (both log and output) contain the job-id, visible after job-submission and via `squeue`.

### Basic: Changing configuration of slurm-script for your task

In the default state `triangle-counting-mpi.sh` configures all MPI related variables and launches `build/Linux-x86_64/mpitc` on small datasets. Based on how you decide to solve the task, changes may be necessary (both for script and dataset). Be sure not to modify the environment variables in the script, this may break the functionality. 

### Advanced: Optimization of ressource allocation

This is optional for the task. You can leave all related variables as they are. However, if you think this can improve running time - you can modify the ressource usage (line 5-13).

Number of CPU-cores/nodes:

```
(line 5-11)
#SBATCH --nodes=2
# Number of processes per Node
#SBATCH --ntasks-per-node=2
# Number of CPU-cores per task
#SBATCH --cpus-per-task=1
# Total number of tasks
#SBATCH --ntasks=4
```

Line 5-13 set the ressource allocation for slurm. Two worker nodes are allocated, where on each node two worker processes are spawned. Each of these processes may use up to one cores. In total four CPU-cores are available for computation. Note, that the total number of processes `#nodes * #ntask-per-node` should be a square number - otherwise the script will fail (see output). Be aware that each node has a certain amount of CPUs available. If the total number of `ntasks-per-node` (with `cpus-per-task=1`) exceeds this availability, the will not be scheduled.

Amount of memory:

```
(line 12-13)
# Set memory allocation per cpu
#SBATCH --mem-per-cpu 1G
```

Line 12-13 set the amount of memory, which slurm allocates per CPU-core. Since per default `--cpus-per-task` is set to one, each worker task can use up to `1G` of memory. This value can be adjusted accordingly, while the upper bound is given by the memory available on the node.