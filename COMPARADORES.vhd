library IEEE;
use IEEE.std_logic_1164.all;

entity COMPARADORES is
	port (
		REG_IN: in std_logic_vector(19 downto 0);
		CONTAD_IN: in std_logic_vector(9 downto 0);
		TESTE_PASS: in std_logic;
		PASS_CERTO, SALDO: out std_logic
	);
end COMPARADORES;

architecture circuito of COMPARADORES is
	
	signal PASSWORD: std_logic_vector(19 downto 0) := "00000001110001100000";
	signal ZERO: std_logic_vector(9 downto 0) := (others => '0');
	signal COMPARA_SENHA: std_logic;
	
	component COMPARA_10 is
		generic (N: integer := 10);
		port (
			A,B: in std_logic_vector((N - 1) downto 0);
			S: out std_logic
		);
	end component;
	
	component COMPARA_20 is
		generic (N: integer := 20);
		port (
			A, B: in std_logic_vector((N - 1) downto 0);
			S: out std_logic
		);
	end component;
	
begin

	C1: COMPARA_10 port map (ZERO, CONTAD_IN, SALDO);
	C2: COMPARA_20 port map (PASSWORD, REG_IN, COMPARA_SENHA);
	PASS_CERTO <= TESTE_PASS and COMPARA_SENHA;
	
end circuito;