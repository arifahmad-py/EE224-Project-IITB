entity nand_op is
port (a,b: in bit; c: out bit);
end entity nand_op;

architecture Struct of nand_op is
signal I: bit;

component not_op
port (x: in bit; z: out bit);
end component not_op;

component and_op
port (x,y : in bit; z: out bit);
end component and_op;

begin
	ab: and_op port map (x=>a, y=>b, z=>I);
	ab_bar: not_op port map (x=>I, z=>c);
end Struct;