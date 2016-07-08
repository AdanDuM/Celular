library IEEE;
use IEEE.std_logic_1164.all;

entity BLOCO_OPERATIVO is
	port (
		CLOCK, RESET_B, C3_IN, C2_IN, C1_IN, C0_IN, SEL_LED_IN, TESTE_PASS_IN : in std_logic;
		SW_IN : in std_logic_vector(9 downto 0);
		ESTADO_IN : in std_logic_vector(4 downto 0);
		SEL_DISP_IN, TENTATIVAS_IN : in std_logic_vector(1 downto 0);
		HEX5_OUT, HEX4_OUT, HEX3_OUT, HEX2_OUT, HEX1_OUT, HEX0_OUT : out std_logic_vector(6 downto 0);
		LEDR_OUT : out std_logic_vector(9 downto 0);
		PASS_CERTO_OUT, SALDO_OUT : out std_logic
	);
end BLOCO_OPERATIVO;

architecture circuito_M of BLOCO_OPERATIVO is
	
	signal CONT_ASC, AGENDA_OUT, REG20, SEQ20 : std_logic_vector(19 downto 0);
	signal CONT_DESC, SENHA_OUT : std_logic_vector(9 downto 0);
	signal SEQ3, SEQ2, SEQ1, SEQ0 : std_logic_vector(4 downto 0);
	signal H5 : std_logic_vector(6 downto 0) := "0000110";
	
	component REGISTRADORES is
		generic (N: integer := 20);
		port (
			CLK, RST, C3, C2, C1, C0: in std_logic;
			REG: in std_logic_vector((N - 1) downto 0);
			SEQ_3, SEQ_2, SEQ_1, SEQ_0: out std_logic_vector(4 downto 0)
		);
	end component;
	
	component COMPARADORES is
		port (
			REG_IN: in std_logic_vector(19 downto 0);
			CONTAD_IN: in std_logic_vector(9 downto 0);
			TESTE_PASS: in std_logic;
			PASS_CERTO, SALDO: out std_logic
		);
	end component;
	
	component SELETORES is
		port (
			CONTA_ASC, AGENDA : in std_logic_vector(19 downto 0);
			CONTA_DESC, SENHA : in std_logic_vector(9 downto 0);
			SL_DISP, TENTATIVAS_IN : in std_logic_vector(1 downto 0);
			SL_LED : in std_logic;
			REG : out std_logic_vector(19 downto 0);
			LED_OUT : out std_logic_vector(9 downto 0)
		);
	end component;
	
	component ROM is
		generic (N: integer := 20);
		port (
			ENDERECO : in std_logic_vector(3 downto 0);
			NOME : out std_logic_vector((N - 1) downto 0)
		);
	end component;
	
	component CONTADORES is
		port (
			CLK50, RESET, SEL_LED: in std_logic;
			SEL_DISP: in std_logic_vector(1 downto 0);
			CONTA_DES: buffer std_logic_vector(9 downto 0);
			CONTA_ASC: buffer std_logic_vector(19 downto 0)
		);
	end component;
	
	component DEC7SEG is
		port (
			E: in std_logic_vector(4 downto 0);
			O: out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	
	L0 :CONTADORES port map (CLOCK, RESET_B, SEL_LED_IN, SEL_DISP_IN, CONT_DESC, CONT_ASC);
	L1 : ROM port map (SW_IN(3 downto 0), AGENDA_OUT);
	L2 : SELETORES port map (CONT_ASC, AGENDA_OUT, CONT_DESC, SW_IN, SEL_DISP_IN, TENTATIVAS_IN, SEL_LED_IN, REG20, LEDR_OUT);
	L3 : REGISTRADORES port map (CLOCK, RESET_B, C3_IN, C2_IN, C1_IN, C0_IN, REG20, SEQ3, SEQ2, SEQ1, SEQ0);
	SEQ20 <= SEQ3 & SEQ2 & SEQ1 & SEQ0;
	L4 : COMPARADORES port map (SEQ20, CONT_DESC, TESTE_PASS_IN, PASS_CERTO_OUT, SALDO_OUT);
	HEX5_OUT <= H5; -- E
	HEX4 : DEC7SEG port map (ESTADO_IN, HEX4_OUT); -- Codigo do Estado Atual
	HEX3 : DEC7SEG port map (SEQ3, HEX3_OUT);
	HEX2 : DEC7SEG port map (SEQ2, HEX2_OUT);
	HEX1 : DEC7SEG port map (SEQ1, HEX1_OUT);
	HEX0 : DEC7SEG port map (SEQ0, HEX0_OUT);
	
	
end circuito_M;