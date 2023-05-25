# Sequential_Signed_Multiplier
Implementing an 8-bit sequential signed multiplier for CSCE 2301 taught by Dr. Mohamed Shalan Spring 2023 at AUC.
# Introduction
The sequential multiplier is designed to perform the multiplication of signed numbers, using two's complement representation. The design process involves creating a block diagram, implementing the design using software tools like Logisim-evolution and Verilog, and finally implementing the design on an FPGA board (DIGILENT BASYS3).
# Specifications
The implemented design utilizes the DIGILENT BASYS3 board, which includes four seven-segment displays, three push buttons, and 16 switches. The switches represent the two numbers to be multiplied in two's complement form, with the leftmost eight switches representing the multiplier and the rightmost eight switches representing the multiplicand. The seven-segment displays are used to display the result of the multiplication, with the leftmost display indicating the sign and the remaining three displays showing the unsigned product. Two push buttons are used to modify the position of the displayed digits, while the third push button initiates the multiplication process. 
# How to perform multiplication on Basys3 : 
1. Set the numbers you wish to multiply using the switches in the order mentioned above. 
2. Press on BTNC<U18> on Basys3 to start multiplication. Note that pressing on BTNC at any point of time will restart multiplication from the beginning based on the current value of the sixtenn swtiches. 
3. To switch between the different digits of the product press on BTNL<W19> to slide the digits to the left or BTNR<T17> to slide the digits to the right.

  
