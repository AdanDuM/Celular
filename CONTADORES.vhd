library IEEE;
use IEEE.std_logic_1164.all;

entity CONTADORES is
	port (
		CLK50, RESET, SEL_LED: in std_logic;
		SEL_DISP: in std_logic_vector(1 downto 0);
		CONTA_DES: buffer std_logic_vector(9 downto 0);
		CONTA_ASC: buffer std_logic_vector(19 downto 0)
	);
end CONTADORES;

architecture circuito of CONTADORES is
	
	signal RST_CONT, CLK1, CLK2: std_logic;
	
	component FSM_CLOCK is
		generic (N: integer := 28);
		port (
			CLK: in std_logic;
			CLK1, CLK2: out std_logic
		);
	end component;
	
	component CONTADOR_ASC is
		generic (N: integer := 20);
		port (
			CLK, RST: in std_logic;
			CONTA_ASCE: buffer std_logic_vector((N - 1) downto 0)
		);
	end component;
	
	component CONTADOR_DESC is
		generic (N: integer := 10);
		port (
			CLK, SET, EN: in std_logic;
			CONTA_DESC: buffer std_logic_vector((N - 1) downto 0)
		);
	end component;
	
	component RESET_CONT is
		port (
			RST: in std_logic;
			SL_DISP: in std_logic_vector(1 downto 0);
			RST_CONTA: out std_logic
		);
	end component;
	
begin
	RC: RESET_CONT port map (RESET, SEL_DISP, RST_CONT);
	CK: FSM_CLOCK port map (CLK50, CLK1, CLK2);
	CON_ASC: CONTADOR_ASC port map (CLK1, RST_CONT, CONTA_ASC);
	CON_DES: CONTADOR_DESC port map (CLK2, RESET, SEL_LED, CONTA_DES);
end circuito;