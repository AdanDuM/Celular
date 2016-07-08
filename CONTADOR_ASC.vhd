library IEEE;
use IEEE.std_logic_1164.all;
use iEEE.std_logic_unsigned.all;

entity CONTADOR_ASC is
	generic (N: integer := 20);
	port (
		CLK, RST: in std_logic;
		CONTA_ASCE: buffer std_logic_vector((N - 1) downto 0)
	);
end CONTADOR_ASC;

architecture circuito of CONTADOR_ASC is
	signal M1, M0, S1, S0: std_logic_vector(4 downto 0) := "00000"; -- M1M0:S1S0 - MM:ss
begin
	
	P1: process (CLK, RST)
	begin
		if RST = '0' then -- Reseta todos os sinais de saida.
			M1 <= "00000"; -- Sinal Responsavel pelo digito de minuto mais significativo.
			M0 <= "00000"; -- Sinal Responsavel pelo digito de minuto menos significativo.
			S1 <= "00000"; -- Sinal Responsavel pelo digito de segundo mais significativo.
			S0 <= "00000"; -- Sinal Responsavel pelo digito de segundo menos significativo.
		elsif rising_edge(CLK) then
			S0	<= S0 + 1; -- Na transicao positiva de clock, soma 1
			if S0 = 9 then -- Caso ja tenha 9 em 
				S0 <= "00000";
				S1 <= S1 + 1;
				if S1 = 5 then
					S0 <= "00000";
					S1 <= "00000";
					M0 <= M0 + 1;
					if M0 = 9 then
						S0 <= "00000";
						S1 <= "00000";
						M0 <= "00000";
						M1 <= M1 + 1;
						if M1 = 5 then
							S0 <= "00000";
							S1 <= "00000";
							M0 <= "00000";
							M1 <= "00000";
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	CONTA_ASCE <= M1 & M0 & S1 & S0;
	
end circuito;