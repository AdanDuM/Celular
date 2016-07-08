library IEEE;
use IEEE.std_logic_1164.all;

entity SELETORES is
	port (
		CONTA_ASC, AGENDA : in std_logic_vector(19 downto 0);
		CONTA_DESC, SENHA : in std_logic_vector(9 downto 0);
		SL_DISP, TENTATIVAS_IN : in std_logic_vector(1 downto 0);
		SL_LED : in std_logic;
		REG : out std_logic_vector(19 downto 0);
		LED_OUT : out std_logic_vector(9 downto 0)
	);
end SELETORES;

architecture circuito of SELETORES is
	
	signal IN_PASS : std_logic_vector(4 downto 0);
	signal PASS : std_logic_vector(19 downto 0);
	signal TENTATIVAS : std_logic_vector(9 downto 0);
	signal ZERO_LED : std_logic_vector(7 downto 0) := (others => '0');
	signal ZERO : std_logic_vector(19 downto 0) := (others => '0');
	
	component DECODIFICADOR_SENHA is
		port (
			SENHA_IN: in std_logic_vector(9 downto 0);
			PASS: out std_logic_vector(4 downto  0)
		);
	end component;
	
	component MUX2x1 is
		generic (N: integer := 10);
		port (
			I0, I1: in std_logic_vector((N - 1) downto 0);
			S: in std_logic;
			O: out std_logic_vector((N - 1) downto  0)
		);
	end component;
	
	component MUX4x1 is
		generic (N: integer := 20);
		port (
			I00, I01, I10, I11: std_logic_vector((N -1) downto 0);
			S: in std_logic_vector(1 downto 0);
			O: out std_logic_vector((N - 1) downto  0)
		);
	end component;
	
begin
	
	TENTATIVAS <= "00000000" & TENTATIVAS_IN;
	
	DECOD : DECODIFICADOR_SENHA port map (SENHA, IN_PASS);
	
	PASS <= IN_PASS & IN_PASS & IN_PASS & IN_PASS;
	
	MU2 : MUX2x1 port map (TENTATIVAS, CONTA_DESC, SL_LED, LED_OUT);
	MU4 : MUX4x1 port map (ZERO, PASS, AGENDA, CONTA_ASC, SL_DISP, REG);
	
end circuito;
