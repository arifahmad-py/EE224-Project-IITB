# EE224-Project-IITB
This is a repository, containing the course project I did in the end of my Course, EE 224- Digital Systems. It was a team project done in collaboration with my classmates Tushar Nandy, Suraj Samaga and Tanmay Jain. All four of us are undergraduates in the Electrical Engineering department, IIT Bombay. In this project, we designed a signed 16-bit  Arithmetic and Logical Unit (ALU). We Used Structural VHDL for the design. The project also contains a Design of a fast adder (Brent Kung/ Kogge Stone) to compute addition operation.

The design and operation of the ALU is as follows-
It can perform the following four operations:

  1. Signed Addition (control input S1S0 = 00)
  2. Subtraction (Control input S1S0 = 01)
  3. NAND operation (Control input S1S0 = 10)
  4. XOR operation (control input S1S0 = 11)
 
The output is a 16 bit result of the computation and carry (in case of arithmetic operation) and zero bit. If the result of computation is zero then it sets the zero output (i.e, z = 1). We Assume that the inputs are in 2’s complement form.

The project also contains a test-bench to verify our design.
