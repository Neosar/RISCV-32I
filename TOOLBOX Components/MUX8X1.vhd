-- Typical 8 to 1 Generic input Multiplexer.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX8X1 IS 
	
	GENERIC ( INSIZE : INTEGER := 10 );
	
	PORT (	
			D0  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D1  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D2  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D3  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D4  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D5  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D6  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			D7  : IN  STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0);
			
		    SEL : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 
		    O : OUT STD_LOGIC_VECTOR(INSIZE-1 DOWNTO 0)
		 );

END MUX8X1;

ARCHITECTURE RTL OF MUX8X1 IS
BEGIN
	PROCESS(SEL,D0,D1,D2,D3,D4,D5,D6,D7)
	BEGIN
		CASE SEL IS 
		
			WHEN "000" => O <= D0;
			WHEN "001" => O <= D1;
			WHEN "010" => O <= D2;
			WHEN "011" => O <= D3;
			WHEN "100" => O <= D4;
			WHEN "101" => O <= D5;
			WHEN "110" => O <= D6;
			WHEN "111" => O <= D7;
			
			WHEN OTHERS => O <= (OTHERS =>'X');
			
		END CASE;
	END PROCESS;
	
END RTL;