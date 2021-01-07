entity or_3 is
	port (s, t, u: in bit; v: out bit);
end entity or_3;

architecture struct of or_3 is
begin
	v <= (s or t or u);
end struct;