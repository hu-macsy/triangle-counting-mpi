# triangle counting with MPI

This repository is based on [KarypisLab/2DTriangleCounting](https://github.com/KarypisLab/2DTriangleCounting) and rewritten to work with slurm. The original Readme, describing and showing the original setup and triangle-counting algorithm was moved to [doc/README.md](https://github.com/hu-macsy/triangle-counting-mpi/blob/master/doc/README.md).

## Running MPI with slurm (multi process)

Besides the possibilty to setup a personal MPI-infrastructure, a slurm wrapper is available (scheduling system). This repo provides a complete and portable script, ready-to-use with the slurm infrastructure at the HU department of Computer Science. For more background information on how slurm works, there is german [doc site](https://www.informatik.hu-berlin.de/de/org/rechnerbetriebsgruppe/dienste/hpc/slurm) available. If you want to use it on other slurm-based infrastructures, minor edits have to be done.

The following is a minimal example of how to run the code of this repo in the infrastructure. 

1. Login to any slurm nodes. This includes any gruenau Server or the pool nodes.
```
ssh <USERNAME>@<SLURM-POOL-NODE>
```

Note: This requires that you have remote access to the HU department of Computer Science server. Normally this is achieved by using either CSM or the department VPN-service.

2. Clone repo and cd into repo:

```
git clone https://github.com/hu-macsy/triangle-counting-mpi/
cd triangle-counting-mpi
```

3. Build the code via using `mpich` and `cmake`:

```
module load mpich/gcc
mkdir build
cd build
cmake ..
make
```

4. Submit job to slurm via `sbatch`:

```
sbatch triangle-counting-mpi.sh
```

You can view the current status of your task by calling `squeue`:

```
brandtfa 54 ( triangle-counting-mpi ) $ squeue
JOBID      PARTITION     NAME     USER      ST       TIME       NODES NODELIST(REASON)
67108957   defq          mpi-test brandtfa  R        00:24      2     kudamm,lankwitz
```

Both log and output from the job is written to `output`-folder. The file-names (both log and output) contain the job-id, visible after job-submission and via `squeue`.

### Changing configuration of slurm-script for your task

In the default state `triangle-counting-mpi.sh` configures all MPI related variables and launches `build/mpitc` on small datasets. Based on how you decide to solve the task, changes may be necessary (both for script and dataset). Be sure not to modify the environment variables in the script, this may break the functionality. 
