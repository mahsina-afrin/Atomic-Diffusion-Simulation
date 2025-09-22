# Atomic Diffusion Simulation

## Overview
This MATLAB project simulates **atomic diffusion** in **FCC (Aluminum)** and **BCC (Iron)** crystal lattices using a **random walk method**. The simulation calculates the **Mean Squared Displacement (MSD)** and **diffusion coefficients (D)** of atoms over time, allowing comparison between FCC and BCC structures.  

The project is aligned with computational materials research and can serve as a foundation for exploring temperature effects, lattice defects, or other diffusion studies.

---

## Features
- Simulates diffusion for multiple atoms in **3D space**.  
- Calculates **MSD** to quantify atomic movement.  
- Computes **diffusion coefficients** using the **Einstein relation**.  
- Visualizes:
  - MSD vs steps
  - Diffusion coefficient vs steps
  - 3D diffusion path of atoms
- Compare FCC vs BCC diffusion behavior.

---

## Folder Structure

Diffusion_Simulation/
├── projectdiffusion.m # Main MATLAB code
├── README.md # Project description
└── results/ # Plots and screenshots from simulation


---

## How to Run
1. Open **MATLAB**.  
2. Navigate to the folder containing `projectdiffusion.m`.  
3. Run the script by typing in the Command Window:
```matlab
projectdiffusion
