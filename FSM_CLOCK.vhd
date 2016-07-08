library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FSM_CLOCK is
	generic (N: integer := 28);
	port (
		CLK: in std_logic;
		CLK1, CLK2: out std_logic
	);
end FSM_CLOCK;

architecture circuito of FSM_CLOCK is
	
	signal CONT1: integer range 0 to 50 * 10**7;
	signal CONT2: integer range 0 to 25 * 10**7;
	
begin
	
	P1: process (CLK)
	begin
		if rising_edge(CLK) then
			CONT1 <= CONT1 + 1;
			if CONT1 = x"2FAF07F" then
				CLK1 <= '1';
				CONT1 <= 0;
			else
				CLK1 <= '0';
			end if;
		end if;
	end process;
	
	P2: process (CLK)
	begin
		if rising_edge(CLK) then
			CONT2 <= CONT2 + 1;
			if CONT2 = x"17D783F" then
				CLK2 <= '1';
				CONT2 <= 0;
			else
				CLK2 <= '0';
			end if;
		end if;
	end process;
	
end circuito;