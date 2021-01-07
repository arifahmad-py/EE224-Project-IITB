entity xor_op is
port (l,m: in bit; n: out bit);
end entity xor_op;

architecture behaviour of xor_op is
signal e,f,g: bit;

component nand_op
port (a,b: in bit; c: out bit);
end component nand_op;

begin
	e0: nand_op port map (a=>l, b=>m, c=>e);
	f0: nand_op port map (a=>l, b=>e, c=>f);
	g0: nand_op port map (a=>m, b=>e, c=>g);
	r0: nand_op port map (a=>f, b=>g, c=>n);
end behaviour;