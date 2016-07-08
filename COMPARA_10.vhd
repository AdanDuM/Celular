library IEEE;
use IEEE.std_logic_1164.all;

entity COMPARA_10 is
	generic (N: integer := 10);
	port (
		A,B: in std_logic_vector((N - 1) downto 0);
		S: out std_logic
	);
end COMPARA_10;

architecture circuito of COMPARA_10 is
begin -- Aqui e feita a comparaçao bit a bit das entradas
	S <= (
		(A(0) xnor B(0)) and
		(A(1) xnor B(1)) and
		(A(2) xnor B(2)) and
		(A(3) xnor B(3)) and
		(A(4) xnor B(4)) and
		(A(5) xnor B(5)) and
		(A(6) xnor B(6)) and
		(A(7) xnor B(7)) and
		(A(8) xnor B(8)) and
		(A(9) xnor B(9))
	); -- E a saida recebera apenas 1 bit resultante da comparaçao.
end circuito;