entity HalfAdder is --  coding the preprocessing unit
port (a,b: in bit; p, g: out bit);
end entity HalfAdder;

architecture struct of HalfAdder is

component xor_op -- propagate
port (l,m: in bit; n: out bit);
end component xor_op;

component and_op -- generate
port (x,y: in bit; z: out bit);
end component and_op;

begin
	p0: xor_op port map (a, b, p);
	g0: and_op port map (a, b, g);
end struct;