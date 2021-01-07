entity ALU is
	port (A: in bit_vector(15 downto 0);
			B: in bit_vector(15 downto 0);
			S1: in bit;
			S0: in bit;
			R: out bit_vector(15 downto 0); -- This is the result
			Z: out bit;
			Cout: out bit);
end entity ALU;

architecture Design of ALU is
	Signal lvl0_p, lvl0_g, lvl1_p, lvl1_g, lvl2_p, lvl2_g, lvl3_p, lvl3_g, lvl4_p, lvl4_g, b_converted, Carry, rout : bit_vector(15 downto 0);
	Signal S1_bar, carry_in: bit;
	-- Signals lvl*_p, lvl*_g will contain the P and G for the corresponding levels
	-- except that lvl0 will contain the outputs from the half adders
	
	component HalfAdder
	port (a,b: in bit; p, g: out bit);
	end component HalfAdder;
	
	component preprocess
	port (Bin, Cin: in bit; Bout: out bit);
	end component preprocess;
	
	component prefix_computation
	port (Pi, Gi, Pi_prev, Gi_prev: in bit; P, G: out bit);
	end component prefix_computation;
	
	component postprocess
	port (S1, S0, P4, G4, p, g, Cin, Ci_prev: in bit; C_next, output: out bit);
	end component postprocess;
	
	component not_op
	port (x: in bit; z: out bit);
	end component not_op;
	
	component and_op
	port (x, y: in bit; z: out bit);
	end component and_op;
	
	component nor_15
	port (rout: bit_vector(15 downto 0); z: out bit);
	end component nor_15;
	
	begin
		
		s1bar: not_op port map (S1, S1_bar);
		cin: and_op port map (S1_bar, S0, carry_in);
		
		-- preprocessing B bit_vector
		gen_preprocess: for I in 0 to 15 generate
			pp_instance: preprocess port map (B(I), carry_in, b_converted(I));
		end generate gen_preprocess;
		
		-- computing 'propagate' and 'generate'
		gen_diamond: for I in 0 to 15 generate
			ha_instance : HalfAdder port map (A(I), b_converted(I), lvl0_p(I), lvl0_g(I));
		end generate gen_diamond;
		
		-- Prefix Computation for level-1
		lvl1_p(0) <= lvl0_p(0);
		lvl1_g(0) <= lvl0_g(0);
		
		level1_prefix: for J in 1 to 15 generate
			pc_instance1: prefix_computation port map (lvl0_p(J), lvl0_g(J), lvl0_p(J-1), lvl0_g(J-1), lvl1_p(J), lvl1_g(J));
		end generate level1_prefix;
		
		-- Prefix Computation for level-2
		lvl2_p(0) <= lvl1_p(0);
		lvl2_g(0) <= lvl1_g(0);
		
		lvl2_p(1) <= lvl1_p(1);
		lvl2_g(1) <= lvl1_g(1);
		
		level2_prefix: for K in 2 to 15 generate
			pc_instance2: prefix_computation port map (lvl1_p(K), lvl1_g(K), lvl1_p(K-1), lvl1_g(K-1), lvl2_p(K), lvl2_g(K));
		end generate level2_prefix;
		
		-- Prefix Computation for level-3
		lvl3_p(0) <= lvl2_p(0);
		lvl3_g(0) <= lvl2_g(0);
		
		lvl3_p(1) <= lvl2_p(1);
		lvl3_g(1) <= lvl2_g(1);
		
		lvl3_p(2) <= lvl2_p(2);
		lvl3_g(2) <= lvl2_g(2);
		
		lvl3_p(3) <= lvl2_p(3);
		lvl3_g(3) <= lvl2_g(3);
		
		level3_prefix: for V in 4 to 15 generate
			pc_instance3: prefix_computation port map (lvl2_p(V), lvl2_g(V), lvl2_p(V-4), lvl2_g(V-4), lvl3_p(V), lvl3_g(V));
		end generate level3_prefix;
		
		-- Prefix Computation for level-4
		lvl4_p(0) <= lvl3_p(0);
		lvl4_g(0) <= lvl3_g(0);

		lvl4_p(1) <= lvl3_p(1);
		lvl4_g(1) <= lvl3_g(1);

		lvl4_p(2) <= lvl3_p(2);
		lvl4_g(2) <= lvl3_g(2);

		lvl4_p(3) <= lvl3_p(3);
		lvl4_g(3) <= lvl3_g(3);

		lvl4_p(4) <= lvl3_p(4);
		lvl4_g(4) <= lvl3_g(4);

		lvl4_p(5) <= lvl3_p(5);
		lvl4_g(5) <= lvl3_g(5);

		lvl4_p(6) <= lvl3_p(6);
		lvl4_g(6) <= lvl3_g(6);
	
		lvl4_p(7) <= lvl3_p(7);
		lvl4_g(7) <= lvl3_g(7);
		
		level4_prefix: for W in 8 to 15 generate
			pc_instance3: prefix_computation port map (lvl3_p(W), lvl3_g(W), lvl3_p(W-8), lvl3_g(W-8), lvl4_p(W), lvl4_g(W));
		end generate level4_prefix;
		
		-- Post Processing
		
		postprocess0: postprocess port map (S1, S0, lvl4_p(0), lvl4_g(0), lvl0_p(0), lvl0_g(0), carry_in, carry_in, Carry(0), rout(0));
		
		gen_postprocess: for I in 1 to 15 generate
			pop_instance: postprocess port map (S1, S0, lvl4_p(I), lvl4_g(I), lvl0_p(I), lvl0_g(I), carry_in, Carry(I-1), Carry(I), rout(I));
		end generate gen_postprocess;
		
		
		-- Computing Cout as Carry_out -----------{Cout <= ((Carry(15)) and not(S1));}
		
		Carry_out : and_op port map (Carry(15) ,S1_bar, Cout);
		
		getting_z: nor_15 port map (rout, Z); 
		
		R(0) <= rout(0);
		R(1) <= rout(1);
		R(2) <= rout(2);
		R(3) <= rout(3);
		R(4) <= rout(4);
		R(5) <= rout(5);
		R(6) <= rout(6);
		R(7) <= rout(7);
		R(8) <= rout(8);
		R(9) <= rout(9);
		R(10) <= rout(10);
		R(11) <= rout(11);
		R(12) <= rout(12);
		R(13) <= rout(13);
		R(14) <= rout(14);
		R(15) <= rout(15);
		
end Design;