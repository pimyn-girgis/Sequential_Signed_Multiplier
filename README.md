# Sequential Signed Multiplier

This project implements an 8-bit sequential signed multiplier for the CSCE 2301 course taught by Dr. Mohamed Shalan in Spring 2023 at AUC. The design is intended to be implemented on the DIGILENT BASYS3 FPGA board using software tools like Logisim-evolution and Verilog.

## Specifications

The implemented design utilizes the DIGILENT BASYS3 board, which provides the following components:

- Four seven-segment displays: Used to display the result of the multiplication.
- Three push buttons: Used for controlling the display and initiating the multiplication process.
- 16 switches: Used to input the two numbers in two's complement form.
- Led (Connected to pin L1) : Used to indicate end of multiplication.

The configuration of the switches is as follows:
- The leftmost eight switches represent the multiplier.
- The rightmost eight switches represent the multiplicand.

The seven-segment displays are used as follows:
- The leftmost display indicates the sign of the product ; if the product is positive , the leftmost display is turned off otherwise it shows the negative sign.
- The remaining three displays show the unsigned product.

The push buttons have the following functions:
- BTNC (Button C, connected to pin U18): Initiates the multiplication process.
- BTNL (Button L, connected to pin W19): Slides the digits of the product to the left.
- BTNR (Button R, connected to pin T17): Slides the digits of the product to the right.

## How to Use

To perform multiplication using the DIGILENT BASYS3 board, follow these steps:

1. Set the numbers you wish to multiply using the switches, according to the provided representation.
2. Press the BTNC button on the DIGILENT BASYS3 board to start the multiplication process. Note that pressing BTNC at any point will restart the multiplication using the current switch settings.
3. To switch between the different digits of the product, press BTNL to slide the digits to the left or BTNR to slide the digits to the right.
## Building and Running with Vivado

To build and run the project using Vivado, follow these steps:

1. Open Vivado and create a new project.
2. Select the appropriate project settings ,we recommend specifiying no RTL sources, and specify the target FPGA device (DIGILENT BASYS3).
3. Add all source files in the repo to the project files.
4. Configure the pin assignments in Vivado to match the DIGILENT BASYS3 board's pin connections for the seven-segment displays, push buttons, and switches as you prefer or use the constraint file provided in the repo to set use the same configuration described in the specifications.
5. Run the synthesis and implementation processes in Vivado to generate the programming file (.bit file) for the FPGA.
6. Connect the DIGILENT BASYS3 board to your computer and program the FPGA with the generated bit file using Vivado or the Digilent Adept software.
7. Once the FPGA is programmed, you can interact with the sequential signed multiplier on the DIGILENT BASYS3 board according to the steps mentioned earlier.
## Implementation

The implementation and design steps are discussed in deatils within the report file. 

## Authors

This project is being developed for the CSCE 2301 course at AUC, Spring 2023, under the guidance of Dr. Mohamed Shalan. The contributors to this project are Ziad Hassan and Pimyn Girgis.

## License

This project is licensed under GPLv2 (see LICENSE file).

