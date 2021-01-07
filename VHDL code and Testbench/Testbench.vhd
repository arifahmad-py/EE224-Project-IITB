entity Testbench is 
end Testbench;

architecture tb of Testbench is
	signal A_t: bit_vector(15 downto 0);
	signal B_t: bit_vector(15 downto 0);
	signal S1_t: bit;
	signal S0_t: bit;
	signal R_t: bit_vector(15 downto 0);
	signal Z_t: bit;
	signal Cout_t: bit;

	component ALU is
		port (A: in bit_vector(15 downto 0);
				B: in bit_vector(15 downto 0);
				S1: in bit;
				S0: in bit;
				R: out bit_vector(15 downto 0);
				Z: out bit;
				Cout: out bit);
	end component;	


begin

	dut_instance: ALU port map(A=>A_t, B=>B_t, S1=>S1_t, S0=>S0_t, R=>R_t, Z=>Z_t ,Cout=>Cout_t);

		process
		begin

		-- testbench for XOR
		S0_t <= '1';
		S1_t <= '1';
		A_t <= "0000000000000000";
		B_t <= "0000000000000000";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '1';
		A_t <= "1111111111111111";
		B_t <= "1111111111111111";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '1';
		A_t <= "0000111100001111";
		B_t <= "1111000011110000";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '1';
		A_t <= "0000000000000000";
		B_t <= "1111111111111111";
		wait for 0.1 ns;
		
		S0_t <= '1';
		S1_t <= '1';
		A_t <= "0000010111011010";
		B_t <= "1010111001101000";
		wait for 0.1 ns;
		-------------------------------------------------------


		-- testbench for NAND
		S0_t <= '0';
		S1_t <= '1';
		A_t <= "0000000000000000";
		B_t <= "0000000000000000";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '1';
		A_t <= "1111111111111111";
		B_t <= "1111111111111111";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '1';
		A_t <= "0000111100001111";
		B_t <= "1111000011110000";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '1';
		A_t <= "0000000000000000";
		B_t <= "1111111111111111";
		wait for 0.1 ns;
		
		S0_t <= '0';
		S1_t <= '1';
		A_t <= "0000010111011010";
		B_t <= "1010111001101000";
		wait for 0.1 ns;
		------------------------------------------------------------


		--Testbench for sum
		S0_t <= '0';
		S1_t <= '0';
		A_t <= "0000000000000000";
		B_t <= "0000000000000000";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '0';
		A_t <= "1111111111111111";
		B_t <= "1111111111111111";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '0';
		A_t <= "0000111100001111";
		B_t <= "1111000011110000";
		wait for 0.1 ns;

		S0_t <= '0';
		S1_t <= '0';
		A_t <= "0000000000000000";
		B_t <= "1111111111111111";
		wait for 0.1 ns;
		
		S0_t <= '0';
		S1_t <= '0';
		A_t <= "0000010111011010";
		B_t <= "1010111001101000";
		wait for 0.1 ns;
		---------------------------------------------------------



		--Testbench for substraction
		S0_t <= '1';
		S1_t <= '0';
		A_t <= "0000000000000000";
		B_t <= "0000000000000000";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '0';
		A_t <= "1111111111111111";
		B_t <= "1111111111111111";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '0';
		A_t <= "0000111100001111";
		B_t <= "1111000011110000";
		wait for 0.1 ns;

		S0_t <= '1';
		S1_t <= '0';
		A_t <= "0000000000000000";
		B_t <= "1111111111111111";
		wait for 0.1 ns;
		
		S0_t <= '1';
		S1_t <= '0';
		A_t <= "0000010111011010";
		B_t <= "1010111001101000";
		wait for 0.1 ns;
		--------------------------------------------------------------

		end process;
end tb;