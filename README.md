# Discrete Wavelet Transform Project

This repository contains a project on Discrete Wavelet Transforms (DWT) implemented in VHDL, with supplementary programs written in Python. The project is designed for deployment on FPGA and was developed as part of a course project on Digital Systems.

## Table of Contents
- [Project Description](#project-description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)

## Project Description
The Discrete Wavelet Transform (DWT) project aims to provide an efficient implementation of DWT using VHDL for FPGA deployment. The project also includes Python scripts for testing and verifying the functionality of the VHDL code. This project was developed as part of a course on Digital Systems and demonstrates the application of DWT in signal processing.

Find a more detailed explanation on Discrete Wavelet Transforms in the `DiscreteWaveletTransforms.md` file in the repository

## Features
- VHDL implementation of DWT
- Python scripts for simulation and testing
- Designed for FPGA deployment
- Modular and easy to extend



## Installation

### Prerequisites
- VHDL simulator (e.g., ModelSim)
- Python 3.x
- Python libraries: `numpy`, `scipy`, `matplotlib`

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/dwt_project.git
   cd dwt_project
   ```
2. Install the required Python libraries:
   ```sh
   pip install numpy scipy matplotlib
   ```

## Usage

### VHDL Simulation
1. Open your VHDL simulator.
2. Load the VHDL files from the `VHDL` directory.
3. Run the testbench (`Testbench.vhd`) to simulate and verify the DWT implementation.

## Contributing
Contributions are welcome! Please fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.


## Acknowledgements
- Course Instructor: Prof. Siddharth Tallur
- FPGA Development Environment: [Tool Name]
- Contributers to the Project: Kshitij Vaidya, Jay Mehta, Adit Srivastave, Jainam Ravani
