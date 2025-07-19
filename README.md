# VASP_job_template
🚀 How to Use This Template
This template provides a standard setup to run VASP jobs using SLURM.

1️⃣ Prepare Input Files

Place the following files in the same directory:

INCAR, POSCAR, POTCAR and KPOINTS
> **Please keep the file names exactly as written: `INCAR`, `POSCAR`, `POTCAR`, `KPOINTS`, and `job.sh`. Do not use lowercase letters, additional characters, or numbers in the file names.**
 

INCAR – Contains VASP simulation parameters.
You can find a full list of available INCAR tags and descriptions on the VASP Wiki.

For geometry optimization, it's important to include:

IBRION – Algorithm for ionic relaxation.
Recommended values:

IBRION = 1: Quasi-Newton algorithm

IBRION = 2: Conjugate gradient (⚠️ often gives stable results)

IBRION = 3: Damped molecular dynamics

In my case, using IBRION = 2 yields reliable and consistent results.

ISIF – Specifies what is allowed to relax:

ISIF = 2: Only atom positions relax (cell shape and volume fixed)

ISIF = 3: Atom positions + cell shape + volume relax

You need to specify an appropriate ENCUT value for your structure. How to determine the correct ENCUT for each system will be explained in a separate section. 

POSCAR – Contains crystal structure information.

POTCAR – Contains pseudopotentials (combine POTCARs for all atoms using cat).

KPOINTS – Contains the k-point sampling grid.

2️⃣ Configure the Job Script
Edit job.sh as needed to match your HPC environment:
you need to specify your each section as your HPC requirements. 
Update the number of nodes and tasks (--nodes, --ntasks)

Set the correct partition (--partition)

Load the appropriate VASP module (module load vasp/…)
Details about the job script (job.sh) will be explained in a separate section.

3️⃣ Submit the Job

Use the sbatch command to submit the job to the SLURM scheduler:

you write as below:

sbatch job.sh

Once submitted, SLURM will queue your job, and output files (OUTCAR, vasp_output.log, etc.) will be generated after execution.
