library IEEE;
use IEEE.std_logic_1164.all;

entity COMPARA_20 is
	generic (N: integer := 20);
	port (
		A, B: in std_logic_vector((N - 1) downto 0);
		S: out std_logic
	);
end COMPARA_20;

architecture circuito of COMPARA_20 is
begin
	S <= (
		(A(0) xnor B(0)) and
		(A(1) xnor B(1)) and
		(A(2) xnor B(2)) and
		(A(3) xnor B(3)) and
		(A(4) xnor B(4)) and
		(A(5) xnor B(5)) and
		(A(6) xnor B(6)) and
		(A(7) xnor B(7)) and
		(A(8) xnor B(8)) and
		(A(9) xnor B(9)) and
		(A(10) xnor B(10)) and
		(A(11) xnor B(11)) and
		(A(12) xnor B(12)) and
		(A(13) xnor B(13)) and
		(A(14) xnor B(14)) and
		(A(15) xnor B(15)) and
		(A(16) xnor B(16)) and
		(A(17) xnor B(17)) and
		(A(18) xnor B(18)) and
		(A(19) xnor B(19))
	);
end circuito;