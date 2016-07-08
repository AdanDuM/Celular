library IEEE;
use IEEE.std_logic_1164.all;
use iEEE.std_logic_unsigned.all;

entity CONTADOR_DESC is
	generic (N: integer := 10);
	port (
		CLK, SET, EN: in std_logic;
		CONTA_DESC: buffer std_logic_vector((N - 1) downto 0)
	);
end CONTADOR_DESC;

architecture circuito of CONTADOR_DESC is
begin
	P1: process (CLK, SET, EN)
	begin
		if SET = '0' then
			CONTA_DESC <= "1111101110";
		elsif rising_edge(CLK) and EN = '1' then
			if CONTA_DESC > 0 then
				CONTA_DESC <= CONTA_DESC - 1;
			end if;
		end if;
	end process;
end circuito;