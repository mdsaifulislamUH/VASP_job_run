🖥️ SLURM Job Script for VASP Calculation
Below is a sample SLURM job submission script (job.sh) used to run a VASP calculation on a high-performance computing (HPC) cluster using 35 CPU cores on a single node.

📁 Filename: job.sh
📌 Usage: Submit the job using:

sbatch job.sh

🔧 SLURM Script
#!/bin/bash
#SBATCH -J energy                      # Job name
#SBATCH -o energy.o%j                  # Output file with job ID
#SBATCH --mail-user=your_email@domain.com  # Email address for notifications
#SBATCH --mail-type=END               # Send email when job ends
#SBATCH --ntasks-per-node=35          # Number of tasks (MPI ranks) per node
#SBATCH -N 1                           # Use 1 node
#SBATCH -t 08:00:00                    # Time limit (hh:mm:ss)
#SBATCH --mem-per-cpu=2GB             # Memory per CPU core

# Run VASP using 35 MPI processes
mpirun -n 35 $VASP/vasp_std | tee vasp.out

📌 Note: Replace your_email@domain.com with your actual email address.

🔍 Notes
Adjust --ntasks-per-node, --mem-per-cpu, and --time based on your system and job size.

Ensure $VASP/vasp_std points to the correct path of your VASP executable.

The output will be saved as energy.o<jobid>.

Email notifications will be sent once the job ends.
