entity prefix_computation is
port (Pi, Gi, Pi_prev, Gi_prev: in bit; P, G: out bit);
end entity prefix_computation;

architecture struct of prefix_computation is
signal PiGi_prev: bit; 

-- G = Gi + Pi.Gi_prev
-- P = Pi.Pi_prev
-- The buffer signal above will store the anded 'Pi.Gi_prev'

component and_op
port (x,y: in bit; z: out bit);
end component and_op;

component or_op
port (x,y: in bit; z: out bit);
end component or_op;

begin
	P_out: and_op port map (Pi, Pi_prev, P);
	
	Pi_Giprev: and_op port map (Pi, Gi_prev, PiGi_prev);
	Gout: or_op port map (Gi, PiGi_prev, G);
	
end struct;