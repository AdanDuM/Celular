library IEEE;
use IEEE.std_logic_1164.all; 

entity DEBOUNCER is
	port (
		CLK : in  std_logic;
		KEY : in std_logic_vector(3 downto 0);
		BTN : out std_logic_vector(3 downto 0)
	);
end DEBOUNCER;

architecture circuito of DEBOUNCER is

	type ESTADOS is (ESPERA_APERTAR, SAIDA_ATIVA, ESPERA_SOLTAR);
	signal E_BTN0, E_BTN1, E_BTN2, E_BTN3 : ESTADOS := ESPERA_APERTAR;
	signal BTN0PE, BTN1PE, BTN2PE, BTN3PE : ESTADOS := ESPERA_APERTAR;

begin

	process (clk) 
	begin
		if rising_edge(CLK) then
			E_BTN0 <= BTN0PE;			
			E_BTN1 <= BTN1PE;
			E_BTN2 <= BTN2PE;
			E_BTN3 <= BTN3PE;
		end if;
	end process;
	
	process (KEY(0),E_BTN0)
	begin
		case E_BTN0 is
			when ESPERA_APERTAR =>
				if KEY(0) = '0' then
					BTN0PE <= SAIDA_ATIVA;
				else
					BTN0PE <= ESPERA_APERTAR;
				end if;
				BTN(0) <= '1';
			when SAIDA_ATIVA =>
				if KEY(0) = '0' then
					BTN0PE <= ESPERA_SOLTAR;
				else
					BTN0PE <= ESPERA_APERTAR;
				end if;	
				BTN(0) <= '0';
			when ESPERA_SOLTAR =>
				if KEY(0) = '0' then
					BTN0PE <= ESPERA_SOLTAR;
				else
					BTN0PE <= ESPERA_APERTAR;
				end if;	
				BTN(0) <= '1';
		end case;		
	end process;
	
	process (KEY(1),E_BTN1)
	begin
		case E_BTN1 is
			when ESPERA_APERTAR =>
				if KEY(1) = '0' then
					BTN1PE <= SAIDA_ATIVA;
				else
					BTN1PE <= ESPERA_APERTAR;
				end if;
				BTN(1) <= '1';
			when SAIDA_ATIVA =>
				if KEY(1) = '0' then
					BTN1PE <= ESPERA_SOLTAR;
				else
					BTN1PE <= ESPERA_APERTAR;
				end if;	
				BTN(1) <= '0';
			when ESPERA_SOLTAR =>
				if KEY(1) = '0' then
					BTN1PE <= ESPERA_SOLTAR;
				else
					BTN1PE <= ESPERA_APERTAR;
				end if;	
				BTN(1) <= '1';
		end case;		
	end process;
	
	process (KEY(2),E_BTN2)
	begin
		case E_BTN2 is
			when ESPERA_APERTAR =>
				if KEY(2) = '0' then
					BTN2PE <= SAIDA_ATIVA;
				else
					BTN2PE <= ESPERA_APERTAR;
				end if;
				BTN(2) <= '1';
			when SAIDA_ATIVA =>
				if KEY(2) = '0' then
					BTN2PE <= ESPERA_SOLTAR;
				else
					BTN2PE <= ESPERA_APERTAR;
				end if;	
				BTN(2) <= '0';
			when ESPERA_SOLTAR =>
				if KEY(2) = '0' then
					BTN2PE <= ESPERA_SOLTAR;
				else
					BTN2PE <= ESPERA_APERTAR;
				end if;	
				BTN(2) <= '1';
		end case;		
	end process;
	
	process (KEY(3),E_BTN3)
	begin
		case E_BTN3 is
			when ESPERA_APERTAR =>
				if KEY(3) = '0' then
					BTN3PE <= SAIDA_ATIVA;
				else
					BTN3PE <= ESPERA_APERTAR;
				end if;
				BTN(3) <= '1';
			when SAIDA_ATIVA =>
				if KEY(3) = '0' then
					BTN3PE <= ESPERA_SOLTAR;
				else
					BTN3PE <= ESPERA_APERTAR;
				end if;	
				BTN(3) <= '0';
			when ESPERA_SOLTAR =>
				if KEY(3) = '0' then
					BTN3PE <= ESPERA_SOLTAR;
				else
					BTN3PE <= ESPERA_APERTAR;
				end if;	
				BTN(3) <= '1';
		end case;		
	end process;

end circuito;