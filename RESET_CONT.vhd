library IEEE;
use IEEE.std_logic_1164.all;

entity RESET_CONT is
	port (
		RST: in std_logic;
		SL_DISP: in std_logic_vector(1 downto 0);
		RST_CONTA: out std_logic
	);
end RESET_CONT;

architecture circuito of RESET_CONT is
begin
	RST_CONTA <= RST and SL_DISP(1) and SL_DISP(0); -- RESETA EM TODOS ESTADOS EXCETO NO RST = '1' e SEL_DISP = '11'
end circuito;