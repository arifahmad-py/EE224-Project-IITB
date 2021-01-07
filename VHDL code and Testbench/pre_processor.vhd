-- This file inverts the bits of B in case of subtraction
-- The control command for subtraction is: S1S0 = 01
-- So A - B = A + (inverted bits B) + 1
-- The '1' can be accomodated in the carry: Cin
-- Implying that we can set Cin = S1_bar * S0
-- Accordingly, we can 'xor' Cin with bits of 'B' and add

entity preprocess is
port (Bin, Cin: in bit; Bout: out bit);
end entity preprocess;

architecture struct of preprocess is

component xor_op
port (l,m: in bit; n: out bit);
end component xor_op;

begin
	b_out: xor_op port map (Cin, Bin, Bout);
end struct;