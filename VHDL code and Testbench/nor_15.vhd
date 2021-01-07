entity nor_15 is
port (rout : in bit_vector(15 downto 0);
		z: out bit);
end entity nor_15;

architecture design of nor_15 is -- design of 15 input or gate

Signal z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15: bit;

component or_op
port (x,y: in bit; z: out bit);
end component or_op;

component not_op
port (x: in bit; z: out bit);
end component not_op;



begin

z_1: or_op port map (rout(0), rout(1), z1);
z_2: or_op port map (z1, rout(2), z2);
z_3: or_op port map (z2, rout(3), z3);
z_4: or_op port map (z3, rout(4), z4);
z_5: or_op port map (z4, rout(5), z5);
z_6: or_op port map (z5, rout(6), z6);
z_7: or_op port map (z6, rout(7), z7);
z_8: or_op port map (z7, rout(8), z8);
z_9: or_op port map (z8, rout(9), z9);
z_10: or_op port map (z9, rout(10), z10);
z_11: or_op port map (z10, rout(11), z11);
z_12: or_op port map (z11, rout(12), z12);
z_13: or_op port map (z12, rout(13), z13);
z_14: or_op port map (z13, rout(14), z14);
z_15: or_op port map (z14, rout(15), z15);
z_final: not_op port map (z15, z);

end design;			

