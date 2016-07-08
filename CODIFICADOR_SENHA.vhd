library IEEE;
use IEEE.std_logic_1164.all;

entity CODIFICADOR_SENHA is
	port (
		SENHA_IN : in std_logic_vector(9 downto 0);
		PASS : out std_logic_vector(4 downto  0)
	);
end CODIFICADOR_SENHA;

architecture circuito of CODIFICADOR_SENHA is
begin
	PASS <=	"00000" when SENHA_IN = "0000000001" else -- 0 quando escolhido SW(0)
				"00001" when SENHA_IN = "0000000010" else -- 1 quando escolhido SW(1)
				"00010" when SENHA_IN = "0000000100" else -- 2 quando escolhido SW(2)
				"00011" when SENHA_IN = "0000001000" else -- 3 quando escolhido SW(3)
				"00100" when SENHA_IN = "0000010000" else -- 4 quando escolhido SW(4)
				"00101" when SENHA_IN = "0000100000" else -- 5 quando escolhido SW(5)
				"00110" when SENHA_IN = "0001000000" else -- 6 quando escolhido SW(6)
				"00111" when SENHA_IN = "0010000000" else -- 7 quando escolhido SW(7)
				"01000" when SENHA_IN = "0100000000" else -- 8 quando escolhido SW(8)
				"01001" when SENHA_IN = "1000000000" else -- 9 quando escolhido SW(9)
				"11111";												-- F quando invalido
end circuito;