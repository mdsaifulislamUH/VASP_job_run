📦 VASP Job Run

This repository provides a clean and standardized template to run VASP jobs using the SLURM scheduler on HPC systems.

🚀 How to Use This Template

1️⃣ Prepare Input Files
Place the following required input files in your working directory:

INCAR – VASP simulation parameters

POSCAR – Crystal structure information

POTCAR – Pseudopotentials (combine all required elements using cat)

KPOINTS – K-point mesh for Brillouin zone sampling

job.sh – SLURM job submission script

⚠️ Important:
Do not rename the files or use lowercase/extra characters. Keep the filenames exactly as above.

📘 INCAR Guidelines

You can explore all available INCAR tags on the VASP Wiki.
For geometry optimization, include:

IBRION – Controls ionic relaxation:

IBRION = 1 → Quasi-Newton

IBRION = 2 → Conjugate gradient (recommended)

IBRION = 3 → Damped molecular dynamics

ISIF – Specifies what can relax:

ISIF = 2 → Only atomic positions

ISIF = 3 → Positions, cell shape, and volume

ENCUT – Energy cutoff
A system-specific value that you must determine separately. (Instructions to be added in a future section.)

2️⃣ Configure the SLURM Job Script

Edit job.sh to match your HPC environment:

Update:

--nodes, --ntasks, --mem, --time, and --partition

Load the correct VASP module:


module load vasp/<version>

Set your email for job notifications

🧠 A full explanation of job.sh is included here.

3️⃣ Submit the Job

Use the following command to submit the job to SLURM:

sbatch job.sh

SLURM will queue the job, and once completed, you'll receive output files such as:

OUTCAR – Main output file

vasp.out – Terminal output
