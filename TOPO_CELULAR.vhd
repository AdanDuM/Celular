library IEEE;
use IEEE.std_logic_1164.all;

entity TOPO_CELULAR is
	port (
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(3 downto 0);
		SW : in std_logic_vector(9 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0);
		HEX4 : out std_logic_vector(6 downto 0);
		HEX5 : out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end TOPO_CELULAR;

architecture circuito of TOPO_CELULAR is
	
	signal C3, C2, C1, C0, SEL_LED, TESTE_PASS, PASS_CERTO, SALDO : std_logic;
	signal SEL_DISP, TENTATIVAS : std_logic_vector(1 downto 0);
	signal BOTOES : std_logic_vector(3 downto 0);
	signal ESTADO : std_logic_vector(4 downto 0);
	
	component BLOCO_OPERATIVO is
		port (
			CLOCK, RESET_B, C3_IN, C2_IN, C1_IN, C0_IN, SEL_LED_IN, TESTE_PASS_IN : in std_logic;
			SW_IN : in std_logic_vector(9 downto 0);
			ESTADO_IN : in std_logic_vector(4 downto 0);
			SEL_DISP_IN, TENTATIVAS_IN : in std_logic_vector(1 downto 0);
			HEX5_OUT, HEX4_OUT, HEX3_OUT, HEX2_OUT, HEX1_OUT, HEX0_OUT : out std_logic_vector(6 downto 0);
			LEDR_OUT : out std_logic_vector(9 downto 0);
			PASS_CERTO_OUT, SALDO_OUT : out std_logic
		);
	end component;
	
	component FSM_CONTROL is
		port (
			CLOCK, RESET, ENTER, SALDO, PASS_CERTO : in std_logic;
			ESTADO : out std_logic_vector(4 downto 0);
			SEL_DISP, TENTATIVAS_OUT : out std_logic_vector(1 downto 0);
			C3, C2, C1, C0, SEL_LED, TESTE_PASS : out std_logic
		);
	end component;
	
	component DEBOUNCER is
		port (
			CLK : in  std_logic;
			KEY : in std_logic_vector(3 downto 0);
			BTN : out std_logic_vector(3 downto 0)
		);
	end component;
	
begin
	
	BTNSYNC : DEBOUNCER port map (CLOCK_50, KEY, BOTOES);
	BCONTROLE : FSM_CONTROL port map (
		CLOCK_50, 
		BOTOES(0), BOTOES(3), 
		SALDO, 
		PASS_CERTO, 
		ESTADO, 
		SEL_DISP, 
		TENTATIVAS, 
		C3, C2, C1, C0, 
		SEL_LED, 
		TESTE_PASS
	);
	BOPERATIVO : BLOCO_OPERATIVO port map (
		CLOCK_50, 
		BOTOES(0), 
		C3, C2, C1, C0, 
		SEL_LED, 
		TESTE_PASS, 
		SW, 
		ESTADO, 
		SEL_DISP, 
		TENTATIVAS, 
		HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, 
		LEDR, 
		PASS_CERTO, 
		SALDO
	);
	
end circuito;