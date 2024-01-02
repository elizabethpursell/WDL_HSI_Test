#!/bin/sh
#SBATCH -J fixed_data 
#SBATCH --time=00-24:00:00 #36  hour run time
#SBATCH -p batch #running on mpi partition
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem-per-cpu=48g
#SBATCH --output=MyJob.%j.%N.out #output file
#SBATCH --error=MyJob.%j.%N.out #Error file
#SBATCH --mail-type=END
#SBATCH --mail-user=sfulle03@tufts.edu


module load anaconda/2021.05
source activate /cluster/home/sfulle03/condaenv/HSI
python3 helper.py "--n_atoms=$1" "--geom=$2" "--recip=$3"


