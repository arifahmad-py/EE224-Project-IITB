entity not_op is
port (x: in bit; z: out bit);
end entity not_op;

architecture design of not_op is -- design of not gate
begin
z <= (not x);
end design;	