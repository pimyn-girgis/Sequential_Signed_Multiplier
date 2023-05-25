# Sequential_Signed_Multiplier
Implementing an 8-bit sequential signed multiplier for CSCE 2301 taught by Dr. Mohamed Shalan Spring 2023 at AUC.
# Introduction
The sequential multiplier is designed to perform the multiplication of signed numbers, using two's complement representation. The design process involves creating a block diagram, implementing the design using software tools like Logisim-evolution and Verilog, and finally implementing the design on an FPGA board (DIGILENT BASYS3).

# Specifications
The implemented design utilizes the DIGILENT BASYS3 board, which includes four seven-segment displays, three push buttons, and 16 switches. The switches represent the two numbers to be multiplied in two's complement form, with the leftmost eight switches representing the multiplier and the rightmost eight switches representing the multiplicand. The seven-segment displays are used to display the result of the multiplication, with the leftmost display indicating the sign and the remaining three displays showing the unsigned product. Two push buttons are used to modify the position of the displayed digits, while the third push button initiates the multiplication process.

# Design Process
The design process involves several steps:

# Block Diagram: 
A block diagram is created to illustrate the overall structure of the design and clarify the logic involved. It helps in identifying any errors early on.

# Implementation using Logisim-evolution: 
Logisim-evolution, an educational software for designing and simulating digital logic circuits, is used to implement the design. It allows for easier validation, error detection, and quick adjustments.

# Finite State Machine for Control Unit: 
A finite state machine is designed to control the operations of the multiplier. It models and controls the system based on the circuit's state, enabling complex control tasks.

# Verilog Implementation: 
The design is translated into Verilog code, connecting the modules in the circuit and defining their behavior. Verilog allows for parallel execution, which may require adjustment for those accustomed to sequential software languages like C.

# FPGA Implementation: 
The design is finally implemented on an FPGA board, specifically DIGILENT BASYS3, using the Verilog code. The board's components, such as seven-segment displays, push buttons, and switches, are utilized for input, output, and control.

# Block Diagram
The block diagram illustrates how the different components of the circuit work together in the multiplication process. It includes the sign checking of the input numbers, loading them into shift registers, and performing the multiplication using a shift-and-add algorithm. The resulting product is stored in a register, and a double dabble algorithm is applied to convert the binary product to binary-coded decimal (BCD) for display on the seven-segment displays.

# Binary to BCD Conversion
To display the product in decimal format, the double dabble algorithm is used for binary to BCD conversion. This algorithm involves shifting the binary number left and adding three whenever a prospective BCD digit is five or larger. The final result represents the BCD value, which can be displayed on the seven-segment displays.
