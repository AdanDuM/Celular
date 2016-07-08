library IEEE;
use IEEE.std_logic_1164.all;

entity REGISTRADORES is
	generic (N: integer := 20);
	port (
		CLK, RST, C3, C2, C1, C0: in std_logic;
		REG: in std_logic_vector((N - 1) downto 0);
		SEQ_3, SEQ_2, SEQ_1, SEQ_0: out std_logic_vector(4 downto 0)
	);
end REGISTRADORES;

architecture circuito of REGISTRADORES is

	component REG_5 is
		generic (N: integer := 5);
		port (
			CLK, RST, EN: in std_logic;
			D: in std_logic_vector((N - 1) downto 0);
			Q: out std_logic_vector((N - 1) downto 0)
		);
	end component;
	
begin
	REG0: REG_5 port map (CLK, RST, C0, REG(4 downto 0), SEQ_0);
	REG1: REG_5 port map (CLK, RST, C1, REG(9 downto 5), SEQ_1);
	REG2: REG_5 port map (CLK, RST, C2, REG(14 downto 10), SEQ_2);
	REG3: REG_5 port map (CLK, RST, C3, REG(19 downto 15), SEQ_3);
end circuito;