library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4x1 is
	generic (N: integer := 20);
	port (
		I00, I01, I10, I11 : std_logic_vector((N -1) downto 0);
		S : in std_logic_vector(1 downto 0);
		O : out std_logic_vector((N - 1) downto  0)
	);
end MUX4x1;

architecture circuito of MUX4x1 is
begin
	O <=	I00 when S = "00" else
			I01 when S = "01" else
			I10 when S = "10" else
			I11;
end circuito;