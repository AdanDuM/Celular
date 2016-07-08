library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FSM_CONTROL is
	port (
		CLOCK, RESET, ENTER, SALDO, PASS_CERTO : in std_logic;
		ESTADO : out std_logic_vector(4 downto 0);
		SEL_DISP, TENTATIVAS_OUT : out std_logic_vector(1 downto 0);
		C3, C2, C1, C0, SEL_LED, TESTE_PASS : out std_logic
	);
end FSM_CONTROL;

architecture circuito of FSM_CONTROL is
	
	type ESTADOS is (DESLIGADO, INTRO_PASS, REG3, REG2, REG1, REG0, TESTE, LIGADO, LIGA);
	signal EA, PE : ESTADOS;
	signal TENTATIVAS : std_logic_vector(1 downto 0) := "00";
	
begin
	
	P1 : process (CLOCK, RESET)
	begin
		if RESET = '0' then --RST assíncrono do registrador do controlador, como foi visto nas aulas de laboratório.
			EA <= DESLIGADO;
		elsif falling_edge(CLOCK) then
			EA <= PE;
		end if;
	end process;
	
	PROXIMO_ESTADO : process (EA, ENTER, PASS_CERTO, TENTATIVAS, SALDO)
	begin
		TENTATIVAS_OUT <= TENTATIVAS;
		case EA is
			when DESLIGADO =>
				if ENTER = '0' then
					PE <= INTRO_PASS;
				else
					PE <= DESLIGADO;
				end if;
			when INTRO_PASS =>
				if ENTER = '0' then
					PE <= REG3;
				else
					PE <= INTRO_PASS;
				end if;
			when REG3 =>
				if ENTER = '0' then
					PE <= REG2;
				else
					PE <= REG3;
				end if;
			when REG2 =>
				if ENTER = '0' then
					PE <= REG1;
				else
					PE <= REG2;
				end if;
			when REG1 =>
				if ENTER = '0' then
					PE <= REG0;
				else
					PE <= REG1;
				end if;
			when REG0 =>
				if ENTER = '0' then -- Cada uma das transicoes de Estado esta atrelado ao pressionar do Enter.
					PE <= TESTE;
				else
					PE <= REG0;
				end if;
			when TESTE =>
				if TENTATIVAS = "11" and PASS_CERTO = '0' then -- Neste trecho estao os testes de Numero de Tentativas
					PE <= DESLIGADO;
				elsif TENTATIVAS <= "11" and PASS_CERTO = '0' then -- E se possui Saldo suficiente.
					PE <= INTRO_PASS;
				else
					PE <= LIGADO;
				end if;
			when LIGADO =>
				if ENTER = '0' then
					PE <= LIGA;
				else
					PE <= LIGADO;
				end if;
			when LIGA =>
				if SALDO = '1' then
					PE <= DESLIGADO;
				elsif SALDO = '0' and ENTER = '0' then
					PE <= LIGADO;
				else
					PE <= LIGA;
				end if;
		end case;
	end process;
	
	SAIDAS : process (EA)
	begin
		if rising_edge(CLOCK) then
			case EA is
				when DESLIGADO => -- Aqui esta definido o RST assíncrono do controlador.
					ESTADO <= "00000";
					TESTE_PASS <= '0';
					TENTATIVAS <= "00";
					SEL_DISP <= "00";
					SEL_LED <= '0';
					C3 <= '1';
					C2 <= '1';
					C1 <= '1';
					C0 <= '1';
				when INTRO_PASS =>
					ESTADO <= "00001";
					TESTE_PASS <= '0';
					SEL_DISP <= "01";
					SEL_LED <= '0';
					C3 <= '0';
					C2 <= '0';
					C1 <= '0';
					C0 <= '0';
				when REG3 =>
					ESTADO <= "00010";
					TESTE_PASS <= '0';
					SEL_DISP <= "01";
					SEL_LED <= '0';
					C3 <= '1';
					C2 <= '0';
					C1 <= '0';
					C0 <= '0';
				when REG2 =>
					ESTADO <= "00011";
					TESTE_PASS <= '0';
					SEL_DISP <= "01";
					SEL_LED <= '0';
					C3 <= '0';
					C2 <= '1';
					C1 <= '0';
					C0 <= '0';
				when REG1 =>
					ESTADO <= "00100";
					TESTE_PASS <= '0';
					SEL_DISP <= "01";
					SEL_LED <= '0';
					C3 <= '0';
					C2 <= '0';
					C1 <= '1';
					C0 <= '0';
				when REG0 =>
					ESTADO <= "00101";
					TESTE_PASS <= '0';
					SEL_DISP <= "01";
					SEL_LED <= '0';
					C3 <= '0';
					C2 <= '0';
					C1 <= '0';
					C0 <= '1';
				when TESTE =>
					ESTADO <= "00110";
					SEL_DISP <= "01";
					SEL_LED <= '0';
					TENTATIVAS <= TENTATIVAS + 1;
					TESTE_PASS <= '1';
					C3 <= '0';
					C2 <= '0';
					C1 <= '0';
					C0 <= '0';
				when LIGADO =>
					ESTADO <= "00111";
					TESTE_PASS <= '0';
					SEL_DISP <= "10";
					SEL_LED <= '0';
					C3 <= '1';
					C2 <= '1';
					C1 <= '1';
					C0 <= '1';
				when LIGA =>
					ESTADO <= "01000";
					TESTE_PASS <= '0';
					SEL_DISP <= "11";
					SEL_LED <= '1';
					C3 <= '1';
					C2 <= '1';
					C1 <= '1';
					C0 <= '1';
			end case;
		end if;
	end process;
	--TENTATIVAS_OUT <= TENTATIVAS;
end circuito;