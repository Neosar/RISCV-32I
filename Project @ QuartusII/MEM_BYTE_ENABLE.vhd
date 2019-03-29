-- +===========================================================+
-- |			RISC-V RV32I(M) ISA IMPLEMENTATION  	       |
-- |===========================================================|
-- |student:    Deligiannis Nikos							   |
-- |supervisor: Aristides Efthymiou						       |
-- |===========================================================|
-- |			    UNIVERSITY OF IOANNINA - 2019 			   |
-- |  					 VCAS LABORATORY 					   |
-- +===========================================================+


-- *** 4/5: MEMORY MODULE DESIGN ***
-------------------------------------------------
-- PART#1: BYTE ENABLE DECODE
-- " Given the 2 bit control bits generated 
--   previously from the ID module, this component
--   generates the proper byte enable signal to
--   feed in the M4K memory block "
-------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MEM_BYTE_ENABLE IS

	PORT(
			OPCODE : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			BYTEEN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	  	);

END MEM_BYTE_ENABLE;

ARCHITECTURE BEHAVIORAL OF MEM_BYTE_ENABLE IS

	BEGIN
	
	BYTEEN <= "0001" WHEN (OPCODE = "00") ELSE
			  "0011" WHEN (OPCODE = "01") ELSE
			  "1111" WHEN (OPCODE = "10") ELSE
			  "ZZZZ";
			  
END BEHAVIORAL;