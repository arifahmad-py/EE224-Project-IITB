entity or_op is
port (x,y: in bit; z: out bit);
end entity or_op;

architecture design of or_op is -- design of or gate
begin
z <= (x or y);
end design;