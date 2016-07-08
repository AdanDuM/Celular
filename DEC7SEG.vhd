library IEEE;
use IEEE.std_logic_1164.all;

entity DEC7SEG is
	port (
		E: in std_logic_vector(4 downto 0);
		O: out std_logic_vector(6 downto 0)
	);
end DEC7SEG;

architecture circuito of DEC7SEG is
begin
	O <=	"1000000" when E = "00000" else -- 0 e O
			"1111001" when E = "00001" else -- 1
			"0100100" when E = "00010" else -- 2 e Z
			"0110000" when E = "00011" else -- 3
			"0011001" when E = "00100" else -- 4
			"0010010" when E = "00101" else -- 5 e S
			"0000010" when E = "00110" else -- 6
			"1111000" when E = "00111" else -- 7
			"0000000" when E = "01000" else -- 8
			"0010000" when E = "01001" else -- 9
			"0001000" when E = "01010" else -- A
 			"0000011" when E = "01011" else -- b
			"1000110" when E = "01100" else -- C
			"0100001" when E = "01101" else -- d
			"0000110" when E = "01110" else -- E
			"0001110" when E = "01111" else -- F
			"0010000" when E = "10000" else -- g
			"0001001" when E = "10001" else -- H e X
			"1001111" when E = "10010" else -- I
			"1100001" when E = "10011" else -- J
			"0000101" when E = "10100" else -- k
			"1000111" when E = "10101" else -- L
			"1001000" when E = "10110" else -- M
			"0101011" when E = "10111" else -- N
			"0001100" when E = "11000" else -- P
			"0011000" when E = "11001" else -- q
			"0101111" when E = "11010" else -- r
			"0000111" when E = "11011" else -- t
			"1000001" when E = "11100" else -- U e V
			"1100011" when E = "11101" else -- w
			"0010001" when E = "11110" else -- y
			"1111111"; -- " " ( Espaco )
end circuito;