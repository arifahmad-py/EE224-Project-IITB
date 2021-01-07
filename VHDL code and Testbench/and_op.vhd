entity and_op is
port (x,y : in bit; z: out bit);
end entity and_op;

architecture design of and_op is -- design of and gate
begin
z <= (x and y);
end design;