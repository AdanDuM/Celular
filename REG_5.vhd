library IEEE;
use IEEE.std_logic_1164.all;

entity REG_5 is
	generic (N: integer := 5);
	port (
		CLK, RST, EN: in std_logic;
		D: in std_logic_vector((N - 1) downto 0);
		Q: out std_logic_vector((N - 1) downto 0)
	);
end REG_5;

architecture circuito of REG_5 is
begin
	process (CLK, RST)
	begin
		if RST = '0' then -- Aqui e definido o RST assincrono
			Q <= (others => '0');
		elsif CLK'event and CLK = '1' then
			if EN = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end circuito;