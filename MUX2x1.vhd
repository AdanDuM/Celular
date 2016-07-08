library IEEE;
use IEEE.std_logic_1164.all;

entity MUX2x1 is
	generic (N: integer := 10);
	port (
		I0, I1 : in std_logic_vector((N - 1) downto 0);
		S : in std_logic;
		O : out std_logic_vector((N - 1) downto  0)
	);
end MUX2x1;

architecture circuito of MUX2x1 is
begin
	O <=	I0 when S = '0' else
			I1;
end circuito;