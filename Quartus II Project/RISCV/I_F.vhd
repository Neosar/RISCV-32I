-- =============================================================
-- 				RISC-V RV32I(M) ISA IMPLEMENTATION 
-- =============================================================
-- student:    Deligiannis Nikos
-- supervisor: Aristides Efthymiou
-- =============================================================
-- 			    UNIVERSITY OF IOANNINA - 2019 
-- =============================================================


-- *** 1/5: INSTRUCTION FETCH (IF) MODULE DESIGN ***

-- "The usage of this module is to get a target address 
-- which is the PC register's value and access the instruction
-- memory at this address to fetch an XLEN word and send it to the
-- next pipeline stage (ID) to be decoded. Instruction memory (RAM) 
-- will be designed using a M4K block provided by the Cyclone-II FPGA
-- processor. Its size will be 128*32 bits (512B)."


-- FUTURE ADDITIONS - TODO:
-- * STALL SIGNAL IMPLEMENTATION: ADD CLK ENABLE TO MEMORY
-- * ...

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY WORK;
USE WORK.TOOLBOX.ALL;

ENTITY I_F IS

	PORT(
			GLB_CLK: IN  STD_LOGIC;
			PC     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			MEMWORD: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			PC_ADD : OUT STD_LOGIC_VECTOR( 6 DOWNTO 0);
			-- Testing Signals --
			TEST_DATA: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			TEST_WREN: IN STD_LOGIC
		);
		
END I_F;

ARCHITECTURE STRUCTURAL OF I_F IS
    
    SIGNAL GND : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS =>'0');
    
BEGIN
	
	MEM: I_F_RAM PORT MAP ( 
							 address => PC(8 DOWNTO 2), -- 2 LSBs will be used for byte padding.
							 clock   => GLB_CLK,
							 data    => TEST_DATA,--GND,
							 wren    => TEST_WREN,--'0',
							 q 		 => MEMWORD
						  );
						  
	PC_ADD <= PC(8 DOWNTO 2);
		 
END STRUCTURAL;					   