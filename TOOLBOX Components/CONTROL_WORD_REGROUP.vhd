LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CONTROL_WORD_REGROUP IS 

	PORT(
		CTRL_WORD : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
			
		TO_EXE_SELECTOR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4 BITS To EXE logic
		TO_EXE_ALU     : OUT STD_LOGIC_VECTOR(8 DOWNTO 0); -- 9 BITS To EXE
		TO_OTHERS      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)  -- 5 BITS To MEM,WB
	    );
		 
END CONTROL_WORD_REGROUP;

ARCHITECTURE RTL OF CONTROL_WORD_REGROUP IS

	BEGIN
			-- JALR               J              PC		    IMM
	TO_EXE_SELECTOR <= CTRL_WORD(0) & CTRL_WORD(2) & CTRL_WORD(3) & CTRL_WORD(4);
	                -- BAS/LOG/ADD OP 		 ALU OP                   INV LOGIC      EQLT           BRANCH         SLT            LUI
	TO_EXE_ALU      <= CTRL_WORD(12 DOWNTO 11) & CTRL_WORD(10 DOWNTO 9) & CTRL_WORD(8) & CTRL_WORD(7) & CTRL_WORD(6) & CTRL_WORD(5) & CTRL_WORD(1);
			-- MEMU               MEMOP                     WB OP
	TO_OTHERS       <= CTRL_WORD(16) & CTRL_WORD(15 DOWNTO 13) & CTRL_WORD(17);
	
END RTL;