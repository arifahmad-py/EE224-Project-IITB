entity postprocess is
port (S1, S0, P4, G4, p, g, Cin, Ci_prev: in bit; C_next, output: out bit);
end entity postprocess;

-- S1, S0 are the control inputs
-- P4, G4 are the Pi and Gi computed from the last level of the fast adder
-- p, g are propagate and generate computed by the half adder
-- Ci_prev is the carry from the previous stage

architecture struct of postprocess is
signal PCin, S1_bar, S0_bar, sum, mux_sum, not_g, mux_nand, control_nand, mux_xor, control_xor: bit;

component not_op
port (x: in bit; z: out bit);
end component not_op;

component xor_op
port (l,m: in bit; n: out bit);
end component xor_op;

component and_op
port (x,y : in bit; z: out bit);
end component and_op;

component or_op
port (x,y: in bit; z: out bit);
end component or_op;

component or_3
	port (s, t, u: in bit; v: out bit);
end component or_3;

begin
	
	-- The xor of the input bits is 'p' itself
	-- When the user writes the control for 'xor', Cin will be 0
	-- This means that B will not be inverted and we can use the 'propagate' signal
	-- The only requirement is to 'and' it with the control input
	controlxor: and_op port map (S1, S0, control_xor);
	muxxor: and_op port map (control_xor, p, mux_xor);
	
	-- The nand of the input bits is the 'not' of 'g' from half adder
	S0bar: not_op port map (S0, S0_bar);
	controlnand: and_op port map (S1, S0_bar, control_nand);
	notg: not_op port map (g, not_g);
	muxnand: and_op port map (not_g, control_nand, mux_nand);
	
	-- Calculating sum of the adder
	s1bar: not_op port map (S1, S1_bar); -- It's this one
	sum_calc: xor_op port map (p, Ci_prev, sum);
	summed: and_op port map (S1_bar, sum, mux_sum);
	
	-- Calculating C_next
	P_Cin: and_op port map (P4, Cin, PCin);
	Cnext: or_op port map (G4, PCin, C_next);
	
	-- This is the final output based on the control input
	-- The three entities being 'or-ed' together (below) already contain the control inputs,
	-- and there is no need to and them with control inputs again
	
	output_unit: or_3 port map (mux_sum, mux_nand, mux_xor, output);
	
end struct;