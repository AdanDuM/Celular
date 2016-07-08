library IEEE;
use IEEE.std_logic_1164.all;

entity ROM is
	generic (N: integer := 20);
	port (
		ENDERECO : in std_logic_vector(3 downto 0);
      NOME : out std_logic_vector((N - 1) downto 0)
	);
end ROM;

architecture circuito of ROM is
	
	type MEMORIA is array (0 to 2**4 - 1) of std_logic_vector((N - 1) downto 0);
	constant AGENDA : MEMORIA := (
		0  => "10011000000101000000", --JOAO
		1  => "11111110000101010010", -- PAI
		2  => "10001111001000000000", --HUgO
		3  => "10101100100010101010", --LISA
		4  => "01010011010101010111", --AdAN
		5  => "11111101100101001110", --mAE
		6  => "01100010100010101010", --CASA
		7  => "10111011101000000000", --NEgO
		8  => "00010010101101001010", --ZArA
		9  => "01100010101001000000", --CAIO
		10 => "01100010101110001110", --CAUE
		11 => "11111010111101000000", -- brO
		12 => "11100011110010101100", --UFSC
		13 => "11011010101101110010", --tAtI
		14 => "01110011011001010011", --EdIJ
		15 => "01011010101101110110"  --bAtm
	);
	
begin

   process (ENDERECO)
   begin
		case ENDERECO is
			when "0000" => NOME <= AGENDA(0);
			when "0001" => NOME <= AGENDA(1);
			when "0010" => NOME <= AGENDA(2);
			when "0011" => NOME <= AGENDA(3);
			when "0100" => NOME <= AGENDA(4);
			when "0101" => NOME <= AGENDA(5);
			when "0110" => NOME <= AGENDA(6);
			when "0111" => NOME <= AGENDA(7);
			when "1000" => NOME <= AGENDA(8);
			when "1001" => NOME <= AGENDA(9);
			when "1010" => NOME <= AGENDA(10);
			when "1011" => NOME <= AGENDA(11);
			when "1100" => NOME <= AGENDA(12);
			when "1101" => NOME <= AGENDA(13);
			when "1110" => NOME <= AGENDA(14);
			when "1111" => NOME <= AGENDA(15);
			when others => NOME <= "00000000000000000000";
		end case;
	end process;
	
end circuito;